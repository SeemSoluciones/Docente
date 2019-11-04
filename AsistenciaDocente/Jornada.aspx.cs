using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AsistenciaDocente
{
    public partial class Jornada : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT IdJornada, Nombre, NombreAbreviado FROM Jornada WHERE  (Nombre LIke '%" + TextBox4.Text + "%')";
            SqlDataSource1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int can = 0;
            SqlDataSource1.InsertParameters["Nombre"].DefaultValue = TextBox6.Text;
            SqlDataSource1.InsertParameters["NombreAbreviado"].DefaultValue = TextBox1.Text;
            can = SqlDataSource1.Insert();
            if (can == 1)
            {
                Response.Write("<script>alert('Se Guardo con Exito')</script>");
                TextBox6.Text = "";
                TextBox1.Text = "";
                TextBox6.Focus();

            }
            else
            {
                Response.Write("<script>alert('Error, No se  Guardo')</script>");
            }
        }
    }
}