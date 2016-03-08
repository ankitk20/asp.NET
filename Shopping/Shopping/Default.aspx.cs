using System;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using Shopping.BusinessLayer;
using System.Data.SqlClient;
using System.Configuration;

namespace Shopping
{
    public partial class Default : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["Shopping"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EmptyCart();
                lblCategoryName.Text = "Popular products at ShoppingHeart";
                panelMyCart.Visible = false;
                panelCheckOut.Visible = false;
                GetCategory();
                GetAllProducts();
                CartEmpty();
            }

        }

        private void GetCategory()
        {
            ShoppingCart k = new ShoppingCart();
            dlCategories.DataSource = null;
            dlCategories.DataSource = k.GetCategories();
            dlCategories.DataBind();
        }

        private void GetProducts(int CategoryID)
        {
            string query = "select * from Products where CategoryID=" + CategoryID;
            ExecuteQueryReturn(query, dlProducts);
        }

        protected void linkButtonCategory_Click(object sender, EventArgs e)
        {
            panelMyCart.Visible = false;
            panelProducts.Visible = true;
            int CategoryID = Convert.ToInt16(((LinkButton)sender).CommandArgument);
            GetProducts(CategoryID);
        }

        protected void buttonAddToCart_Click(object sender, EventArgs e)
        {
            string ProductID = Convert.ToInt16(((Button)sender).CommandArgument).ToString();
            string query = "insert CartItems (ProductID,ProductName,ProductDescription,ProductPrice,ImageUrl) select ProductID,Name, Description, Price, ImageUrl from Products where ProductID=" + ProductID;
            ExecuteQueryReturn(query, dlProductsCart);

            int count = Convert.ToInt32(buttonCartCount.Text);
            count++;
            buttonCartCount.Text = count.ToString();

            ((Button)sender).Enabled = false;

            HighLightCartProduct(sender);
        }

        private void GetMyCart()
        {
            string query = "select * from cartItems";
            ExecuteQueryReturn(query, dlProductsCart);
        }

        public void lblLogo_Click(object sender, EventArgs e)
        {
            lblCategoryName.Text = "Popular products at ShoppingHeart";
            lblProducts.Text = "Categories";
            panelMyCart.Visible = false;
            panelCheckOut.Visible = false;
            panelCategories.Visible = true;
            panelProducts.Visible = true;
            string query = "select * from Products where ProductId not in( select productID from CartItems)"; // here's the trick !!
            using (SqlConnection connection = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.CommandType = CommandType.Text;
                connection.Open();
                dlProducts.DataSource = cmd.ExecuteReader();
                dlProducts.DataBind();
            }
        }

        protected void buttonCartCount_Click(object sender, EventArgs e)
        {
            GetMyCart();
            lblCategoryName.Text = "Products in your Cart";
            lblProducts.Text = "CheckOut Form";
            panelMyCart.Visible = true;
            panelCategories.Visible = false;
            panelProducts.Visible = false;
            panelCheckOut.Visible = true;
            TotalCalculator();
            CartEmpty();
        }

        public void GetAllProducts()
        {
            string query = "select * from products";
            ExecuteQueryReturn(query, dlProducts);
           
        }



        protected void dlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void dlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



        public DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, connection);
            da.Fill(dt);
            connection.Close();

            return dt;
        }

        protected void buttonRemoveFromCart_Click(object sender, EventArgs e)
        {
            int productID = Convert.ToInt32(((Button)sender).CommandArgument);

            string query = "delete from CartItems where ProductID = " + productID;
            ExecuteQueryNonReturn(query);

            query = "select * from CartItems";
            ExecuteQueryReturn(query, dlProductsCart);
            TotalCalculator(); // calculate the total amount of cartProducts

            /* decrements the cartcount*/
            int cartCount = Convert.ToInt32(buttonCartCount.Text);
            cartCount--;
            buttonCartCount.Text = cartCount.ToString();

            ((Button)sender).Enabled = true;

            CartEmpty(); // checks if cart is empty and displays appropriate image
        }

        private void EmptyCart()
        {
            string query = "truncate table CartItems";
            ExecuteQueryNonReturn(query);
        }

        private void TotalCalculator()
        {
            int total = 0;
            foreach (DataListItem item in dlProductsCart.Items)
            {
                string amt = ((Label)item.FindControl("lblPriceCart")).Text;
                total += Convert.ToInt32(amt);
            }

            totalAmt.Text = "Rs. " + total.ToString();
        }

        private void CartEmpty()
        {
            emptyCart.Visible = false;
            placeOrder.Enabled = true;
            if (buttonCartCount.Text == "0")
            {
                emptyCart.Visible = true;
                placeOrder.Enabled = false;
            }
        }

        private void HighLightCartProduct(object sender)
        {
            Button buttonAddToCart = (Button)sender;
            buttonAddToCart.BackColor = Color.Green;
            buttonAddToCart.Text = "Added to Cart";
        }

        private void ExecuteQueryReturn(string query, DataList context)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.CommandType = CommandType.Text;
                connection.Open();
                context.DataSource = cmd.ExecuteReader();
                context.DataBind();
            }
        }

        private void ExecuteQueryNonReturn(string query)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.CommandType = CommandType.Text;
                connection.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void placeOrder_Click(object sender, EventArgs e)
        {

        }
    }
}
