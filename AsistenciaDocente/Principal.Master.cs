using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AsistenciaDocente
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Label3.Text == "")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                try
                {
                    Label3.Text = Session["Maestro"].ToString();
                    Label5.Text = Session["Puesto"].ToString();
                    //Label6.Text = Session["Tienda"].ToString();
                }
                catch
                {
                    Response.Redirect("Login.aspx");
                }
            }

        }
    }
}