using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AsistenciaDocente
{
    public partial class TipoES : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT IdTipoES,TipoES FROM TipoES WHERE  (TipoES LIke '%" + TextBox4.Text + "%')";
            SqlDataSource1.DataBind();

        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            int can = 0;
            SqlDataSource1.InsertParameters["TipoES"].DefaultValue = TextBox6.Text;

            can = SqlDataSource1.Insert();
            if (can == 1)
            {
                Response.Write("<script>alert('Se Guardo con Exito')</script>");
                TextBox6.Text = "";

                TextBox6.Focus();

            }
            else
            {
                Response.Write("<script>alert('Error, No se  Guardo')</script>");
            }
        }
    }
}