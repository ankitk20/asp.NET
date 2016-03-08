using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void buttonSubmit_Click(object sender, EventArgs e)
        {
            string LoginID = WebConfigurationManager.AppSettings["AdminLoginId"];
            string Password = WebConfigurationManager.AppSettings["AdminPassword"];

            if ( loginId.Text==LoginID && password.Text==Password )
            {
                Session["Shopping"] = "Shopping";
                Response.Redirect("~/Admin/AddNewProduct.aspx");
            }
            else
            {
                //display error upon invalid args
                loginId.Text = string.Empty;
                password.Text = string.Empty;
            }
        }
    }
}