using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ValidationControls
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CustomValidatorPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string data = args.Value;
            args.IsValid = false; //start by setting false
            if (data.Length < 6 || data.Length > 12) return;
            bool uc = false;
            foreach (char c in data) {
                if (c >= 'A' && c <= 'Z') {
                    uc = true; break;
                }
            }
            if (!uc) return;
            bool lc = false;
            foreach (char c in data)
            {
                if (c >= 'a' && c <= 'z')
                {
                    lc = true; break;
                }
            }
            if (!lc) return;
            bool num = false;
            foreach (char c in data)
            {
                if (c >= '0' && c <= '9')
                {
                    num = true; break;
                }
            }
            if (!num) return;
            args.IsValid = true;
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            btnRegister.ToolTip = "Button clicked!";
            
        }

        //This method clears all the input the boxes
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            //Clear all the text boxes
            txtbName.Text = "";
            txtbEmail.Text = "";
            txtbPassword.Text = "";
            txtbConfPassword.Text = "";
        }
    }
}