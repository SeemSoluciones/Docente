using System;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;
using System.Data;


namespace AsistenciaDocente.Reportes
{
    public partial class ReporteMaestro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            MostrarReporte();
        }

        private void MostrarReporte()
        {
            ReportViewer1.Reset();

            DataTable dt = GenerarReporte(Convert.ToInt32(DropDownList1.SelectedValue));
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);

            ReportViewer1.LocalReport.DataSources.Add(rds);

            ReportViewer1.LocalReport.ReportPath = "Reportes/ReportDocente.rdlc";

            ReportParameter[] rptpara = new ReportParameter[]
            {
                
                new ReportParameter("Maestro",DropDownList1.SelectedValue)

            };
            ReportViewer1.LocalReport.SetParameters(rptpara);
            ReportViewer1.LocalReport.Refresh();
        }

        private DataTable GenerarReporte(int Tienda)
        {
            DataTable dt = new DataTable();
            string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ReporteMaestro", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@IdMaestro", SqlDbType.Int).Value = Tienda;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);

            }
            return dt;
        }



    }
}