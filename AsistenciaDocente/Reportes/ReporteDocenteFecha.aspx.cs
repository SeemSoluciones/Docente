﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

namespace AsistenciaDocente.Reportes
{
    public partial class ReporteDocenteFecha : System.Web.UI.Page
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

            DataTable dt = GenerarReporte(DateTime.Parse(FechaInicio.Text), DateTime.Parse(FechaFinal.Text), Convert.ToInt32(DropDownList1.SelectedValue));
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);

            ReportViewer1.LocalReport.DataSources.Add(rds);

            ReportViewer1.LocalReport.ReportPath = "Reportes/ReportDocenteFecha.rdlc";

            ReportParameter[] rptpara = new ReportParameter[]
            {
                new ReportParameter("FeInicio",FechaInicio.Text),
                new ReportParameter("FeFinal",FechaFinal.Text),
                new ReportParameter("Docente",DropDownList1.SelectedValue)

            };
            ReportViewer1.LocalReport.SetParameters(rptpara);
            ReportViewer1.LocalReport.Refresh();
        }

        private DataTable GenerarReporte(DateTime inicio, DateTime final, int Tienda)
        {
            DataTable dt = new DataTable();
            string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ReporteMaestroFecha", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@FechaInicio", SqlDbType.DateTime).Value = inicio;
                cmd.Parameters.Add("@FechaFinal", SqlDbType.DateTime).Value = final;
                cmd.Parameters.Add("@IdMaestro", SqlDbType.Int).Value = Tienda;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);

            }
            return dt;
        }

    }
}