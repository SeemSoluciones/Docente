using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace AsistenciaDocente
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ToString());
            con.Open();
            string consulta = "select count(*) from Maestro inner join Puesto on Maestro.IdPuesto=Puesto.IdPuesto where Maestro.Usuario='"+TextBox1.Text+"'and Maestro.Contrasena='"+TextBox2.Text+"'";
            SqlCommand cmd = new SqlCommand(consulta, con);
            string salida = cmd.ExecuteScalar().ToString();

            if (salida == "1")
            {
                //Session["user"] = TextBox2.Text;
                SqlDataSource1.SelectParameters["Usuario"].DefaultValue = TextBox1.Text;
                SqlDataSource1.SelectParameters["Contrasena"].DefaultValue = TextBox2.Text;
                SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader listaProd;
                listaProd = (SqlDataReader)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (listaProd.Read())
                {
                    Session["Maestro"] = listaProd["Nombre"].ToString();
                    Session["Puesto"] = listaProd["NombreP"].ToString();
                    Session["IdMaestro"] = listaProd["IdMaestro"].ToString();
                    
                    Session["IdPuesto"] = listaProd["IdPuesto"].ToString();

                    if (listaProd["NombreP"].ToString() == "Admin")
                    {
                        Response.Redirect("~/PanelPricipal.aspx");

                    }
                    else if (listaProd["NombreP"].ToString() == "Cajero")
                    {
                        Response.Redirect("~/Caja2.aspx");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Usuario o Contraseña Incorrecta')</script>");

                //Response.Redirect("~/Login.aspx");

                TextBox1.Focus();

            }



        }
    }
}