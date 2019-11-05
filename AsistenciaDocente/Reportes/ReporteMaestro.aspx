<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ReporteMaestro.aspx.cs" Inherits="AsistenciaDocente.Reportes.ReporteMaestro" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
       

        <div class="col-md-4">
    <div class="form-group">
    <label>Docente</label>
        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="IdMaestro"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT [IdMaestro], [Nombre] FROM [Maestro]"></asp:SqlDataSource>
    </div>
        </div>
    </div>

     <asp:Button ID="Button4" runat="server" Text="Generar Reporte" CssClass="btn btn-success pull-right" Width="200"  OnClick="Button4_Click"> </asp:Button>


    <br />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" SizeToReportContent="True" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <localreport reportpath="Reportes\ReportDocente.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
            </DataSources>
        </localreport>
    </rsweb:ReportViewer>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

</asp:Content>
