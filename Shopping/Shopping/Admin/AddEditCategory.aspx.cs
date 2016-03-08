using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shopping.BusinessLayer;
namespace Shopping.Admin
{
    public partial class AddEditCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonSubmit_Click(object sender, EventArgs e)
        {

            ShoppingCart shopcart = new ShoppingCart
            {
                CategoryName = txtCategoryName.Text
            };
            shopcart.AddNewCategory();
            txtCategoryName.Text = string.Empty;
            Response.Redirect("~/Admin/AddNewProduct.aspx");
        }
    }
}