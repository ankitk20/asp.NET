using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shopping.BusinessLayer;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Shopping.Admin
{
    public partial class AddNewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetCategories();
            }
        }

        private void GetCategories()
        {
            string connString = ConfigurationManager.ConnectionStrings["Shopping"].ConnectionString;
            using ( SqlConnection connection = new SqlConnection( connString) )
            {
                SqlCommand cmd = new SqlCommand("Select * from Category",connection);
                connection.Open();
                ddlCategory.DataSource = cmd.ExecuteReader();
                ddlCategory.DataBind();                
            }
        }

        protected void ProductSubmit_Click(object sender, EventArgs e)
        {
            if (uploadProductPhoto.PostedFile!=null)
            {
                SaveProductPhoto();
                ShoppingCart k = new ShoppingCart() {
                    ProductName = txtProductName.Text,
                    ProductImage = "~/ProductImages/" + uploadProductPhoto.FileName,
                    ProductPrice = txtProductPrice.Text,
                    ProductDescription = txtProductDescription.Text,
                    CategoryID = Convert.ToInt32(ddlCategory.SelectedValue)
                };

                k.AddNewProduct();
                ClearText();
                Response.Redirect("~/Admin/AddNewProduct.aspx?alert=success");
            }
            else
            {
                //Alert.Show("upload product photo");
                Response.Write("<script>alert('Please upload photo');</script>");
            }
     
        }
        

        private void ClearText()
        {
            uploadProductPhoto = null;
            txtProductName.Text = string.Empty;
            txtProductDescription.Text = string.Empty;
            txtProductPrice.Text = string.Empty;
            //txtProductQuantity.Text = string.Empty;
        }
        private void SaveProductPhoto()
        {
            if(uploadProductPhoto.PostedFile!=null)
            {
                string fileName = uploadProductPhoto.PostedFile.FileName.ToString();
                string fileExt = System.IO.Path.GetExtension(uploadProductPhoto.FileName);

                //check filename length
                if(fileName.Length>96)
                {
                    //Alert.Show("Image should not exceed 96 characters");
                }
                else if(fileExt!=".jpeg" && fileExt!=".jpg" && fileExt!=".png" && fileExt!=".bmp")
                {
                    //Alert.Show("only above extensions are allowed");
                }
                else if(uploadProductPhoto.PostedFile.ContentLength>400000)
                {
                    //Alert.Show("image size should be less than 4mb");
                }
                else
                {
                    uploadProductPhoto.SaveAs(Server.MapPath("~/ProductImages/"+fileName));
                }
            }
        }
    }
}