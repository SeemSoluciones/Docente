<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Asistencia.aspx.cs" Inherits="AsistenciaDocente.Asistencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function mueveReloj() {
            momentoActual = new Date();
            hora = momentoActual.getHours();
            minuto = momentoActual.getMinutes();
            segundo = momentoActual.getSeconds();

            str_segundo = new String(segundo);
            if (str_segundo.length == 1)
                segundo = "0" + segundo;

            str_minuto = new String(minuto);
            if (str_minuto.length == 1)
                minuto = "0" + minuto;

            str_hora = new String(hora);
            if (str_hora.length == 1)
                hora = "0" + hora;

            horaImprimible = hora + " : " + minuto + " : " + segundo;

            document.reloj.value = horaImprimible;
        }
        setTimeout("mueveReloj()", 1000);
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" onload="mueveReloj();">
 
<div class="login-box">
  <div class="login-logo">
      <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
      <br />
      <asp:Label ID="Label2" name ="reloj" runat="server" Text="Hora"></asp:Label>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Ingrese sus credenciales.</p>


      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Usuario" id="User" runat="server"/>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" id="Pass" runat="server"/>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
            <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-primary btn-block btn-flat" OnClick="Button1_Click" />
        </div>
        <!-- /.col -->
          <table class="table table-striped"> 
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                      <Columns>
                          <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                          <asp:BoundField DataField="TotalID" HeaderText="Estado" ReadOnly="True" SortExpression="TotalID" />
                      </Columns>
                      <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                      <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                      <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                      <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                      <SortedAscendingCellStyle BackColor="#F7F7F7" />
                      <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                      <SortedDescendingCellStyle BackColor="#E5E5E5" />
                      <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AsistenciaConnectionString %>" SelectCommand="SELECT Maestro.Nombre, COUNT(Maestro.Nombre) AS TotalID FROM Maestro INNER JOIN Horario ON Maestro.IdMaestro = Horario.IdMaestro INNER JOIN TipoES ON Horario.IdTipoES = TipoES.IdTipoES WHERE (Horario.Fecha = @fecha) GROUP BY Maestro.Nombre">
                    <SelectParameters>
                        <asp:Parameter Name="fecha" />
                    </SelectParameters>
                </asp:SqlDataSource>
              </table>
      </div>

       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT Maestro.IdMaestro, Maestro.Nombre, Puesto.IdPuesto,Puesto.NombreP FROM Maestro INNER JOIN Puesto ON Maestro.IdPuesto = Puesto.IdPuesto WHERE (Maestro.Usuario = @Usuario) AND (Maestro.Contrasena = @Contrasena)">
          <SelectParameters>
              <asp:Parameter Name="Usuario" />
              <asp:Parameter Name="Contrasena" />
          </SelectParameters>
        </asp:SqlDataSource>

      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AsistenciaConnectionString %>" InsertCommand="INSERT INTO Horario(Hora, Fecha, IdMaestro, IdTipoES) VALUES (@Hora, @Fecha, @Id, @Tipo)" SelectCommand="SELECT IdMaestro, IdHorario, Hora, Fecha, IdTipoES FROM Horario">
          <InsertParameters>
              <asp:Parameter Name="Hora" />
              <asp:Parameter Name="Fecha" />
              <asp:Parameter Name="Id" />
              <asp:Parameter Name="Tipo" />
          </InsertParameters>
      </asp:SqlDataSource>

      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AsistenciaConnectionString %>" SelectCommand="SELECT COUNT(Horario.IdHorario) AS Total FROM Horario INNER JOIN Maestro ON Horario.IdMaestro = Maestro.IdMaestro WHERE (Maestro.Usuario = @User ) AND (Maestro.Contrasena = @Pass) AND (Horario.Fecha = @fecha)">
          <SelectParameters>
              <asp:Parameter Name="User" />
              <asp:Parameter Name="Pass" />
              <asp:Parameter Name="fecha" />
          </SelectParameters>
      </asp:SqlDataSource>

    <!-- /.social-auth-links -->

  </div>
    </div>
  <!-- /.login-box-body -->
           
        
  <!-- /.login-box  -------------------------------------------------- ---> 
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</>

</asp:Content>
