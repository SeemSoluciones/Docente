<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AsistenciaDocente.Login" %>

<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>TiendaConce - Login </title>

  <link rel="stylesheet" href="Login/css/reset.css">

    <link rel="stylesheet" href="Login/css/style.css" media="screen" type="text/css" />

</head>

<body>
    <form id="form1" runat="server">
  <div class="wrap">
		<div class="avatar">
      <img src="Login/imagenes/logo.jpg">
		</div>
		
<asp:TextBox ID="TextBox1" runat="server" placeholder="Usuario"  required="Usuario"></asp:TextBox><br />
		
		
<asp:TextBox ID="TextBox2" runat="server" placeholder="Contraseña" TextMode="Password" required="password"></asp:TextBox><br />
		
	
    
          <asp:Button ID="Button1" runat="server" Text="Acceder" width="100%" OnClick="Button1_Click" />
     
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT Maestro.IdMaestro, Maestro.Nombre, Puesto.IdPuesto,Puesto.NombreP FROM Maestro INNER JOIN Puesto ON Maestro.IdPuesto = Puesto.IdPuesto WHERE (Maestro.Usuario = @Usuario) AND (Maestro.Contrasena = @Contrasena)">
          <SelectParameters>
              <asp:Parameter Name="Usuario" />
              <asp:Parameter Name="Contrasena" />
          </SelectParameters>
        </asp:SqlDataSource>
      
	</div>

  <script src="Login/js/index.js"></script>
</form>
</body>

</html>

