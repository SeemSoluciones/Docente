using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data.Sql;

namespace AsistenciaDocente
{
    public partial class Asistencia : System.Web.UI.Page
    {
        Timer reloj;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = System.DateTime.Today.ToString("dd/MM/yyyy");
            Label2.Text = DateTime.Now.ToShortTimeString();
            SqlDataSource4.SelectParameters["fecha"].DefaultValue = Label1.Text;
            SqlDataSource4.DataSourceMode = SqlDataSourceMode.DataReader;
            
        }


  

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.SelectParameters["Usuario"].DefaultValue = User.Value;
                SqlDataSource1.SelectParameters["Contrasena"].DefaultValue = Pass.Value;
                SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader ListaUser;
                ListaUser = (SqlDataReader)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (ListaUser.Read())
                {
                    SqlDataSource3.SelectParameters["User"].DefaultValue = User.Value;
                    SqlDataSource3.SelectParameters["Pass"].DefaultValue = Pass.Value;
                    SqlDataSource3.SelectParameters["fecha"].DefaultValue = Label1.Text;
                    SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader ListaTotal;
                    ListaTotal = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
                    if(ListaTotal.Read())
                    {
                        if(Convert.ToInt16( ListaTotal["Total"]) == 1)
                        {
                            int ms = 0;
                            SqlDataSource2.InsertParameters["Hora"].DefaultValue = Label2.Text;
                            SqlDataSource2.InsertParameters["Fecha"].DefaultValue = Label1.Text;
                            SqlDataSource2.InsertParameters["Id"].DefaultValue = ListaUser["IdMaestro"].ToString();
                            SqlDataSource2.InsertParameters["Tipo"].DefaultValue = "2";
                            ms = SqlDataSource2.Insert();
                            if (ms > 0)
                            {
                                Response.Write("<script>alert('Asistencia de egreso correcto de: " + ListaUser["Nombre"].ToString() + "')</script>");
                                User.Value = "";
                            }
                        }
                        else if(Convert.ToInt16(ListaTotal["Total"]) == 0)
                        {
                            int ms = 0;
                            SqlDataSource2.InsertParameters["Hora"].DefaultValue = Label2.Text;
                            SqlDataSource2.InsertParameters["Fecha"].DefaultValue = Label1.Text;
                            SqlDataSource2.InsertParameters["Id"].DefaultValue = ListaUser["IdMaestro"].ToString();
                            SqlDataSource2.InsertParameters["Tipo"].DefaultValue = "1";
                            ms = SqlDataSource2.Insert();
                            if(ms > 0)
                            {
                                Response.Write("<script>alert('Asistencia de ingreso correcto de: " + ListaUser["Nombre"].ToString() + "')</script>");
                                User.Value = "";
                            }
                        }
                        else
                        {
                        Response.Write("<script>alert('" + ListaUser["Nombre"].ToString() + ", Ya tiene asistencia de entrada y salida.')</script>");
                        User.Value = "";
                    }
                    }
                    else
                    {
                        Response.Write("<script>alert('Error, contacta a su administrador')</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert('Error, no se registro en el sistema')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Error, ingrese un usario correcto')</script>");
            }
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string _estado = DataBinder.Eval(e.Row.DataItem, "TotalID").ToString();
                if (_estado == "1")
                {
                    e.Row.Cells[1].Text = "ON";
                    e.Row.Cells[1].BackColor = System.Drawing.Color.GreenYellow;
                }
                if (_estado == "2")
                {
                    e.Row.Cells[1].Text = "OFF";
                    e.Row.Cells[1].BackColor = System.Drawing.Color.Red;
                }

            }
        }

  
    }
}