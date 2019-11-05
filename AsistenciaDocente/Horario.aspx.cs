using System;

namespace AsistenciaDocente
{
    public partial class Horario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int ms = 0;
            ListaEmpleado.InsertParameters["He"].DefaultValue = hora.Text;
            ListaEmpleado.InsertParameters["Hs"].DefaultValue = salida.Text;
            ListaEmpleado.InsertParameters["IdD"].DefaultValue = DropDownList1.SelectedValue;
            ListaEmpleado.InsertParameters["IdJ"].DefaultValue = DropDownList2.SelectedValue;
            ListaEmpleado.InsertParameters["IdM"].DefaultValue = DropDownList4.SelectedValue;
            ms = ListaEmpleado.Insert();
            if(ms > 0)
            {
                Response.Write("<script>alert('Horario agregado correctamente)</script>");
            }
            else
            {
                Response.Write("<script>alert('Error, intente nuevamente')</script>");
            }
        }
    }
}