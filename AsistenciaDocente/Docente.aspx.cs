using System;

namespace AsistenciaDocente
{
    public partial class Docente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int can = 0;
            ListaEmpleado.InsertParameters["Nombre"].DefaultValue = nombre.Text;
            ListaEmpleado.InsertParameters["Direccion"].DefaultValue = direccion.Text;
            ListaEmpleado.InsertParameters["Celular"].DefaultValue = telefono.Text;
            ListaEmpleado.InsertParameters["FechaNacimiento"].DefaultValue = apellido.Text;
            ListaEmpleado.InsertParameters["DPI"].DefaultValue = dpi.Text;
            ListaEmpleado.InsertParameters["IdPuesto"].DefaultValue = DropDownList3.SelectedValue;
            ListaEmpleado.InsertParameters["Usuario"].DefaultValue = user.Text;
            ListaEmpleado.InsertParameters["Contrasena"].DefaultValue = contra.Text;

            can = ListaEmpleado.Insert();
            if (can == 1)
            {
                Response.Write("<script>alert('Se Guardo con Exito')</script>");
                nombre.Text = "";
                direccion.Text = "";
                telefono.Text = "";
                dpi.Text = "";
                user.Text = "";
                contra.Text = "";
                dpi.Focus();

            }
            else
            {
                Response.Write("<script>alert('Error, No se  Guardo')</script>");
            }
        }
    }
}