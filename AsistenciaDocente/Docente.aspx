<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Docente.aspx.cs" Inherits="AsistenciaDocente.Docente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="content-header">
        <h1 align="center" >Docentes</h1>
    </section>
    <section class="content">
              <div class="input-group custom-search-form">
                 <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
        <span class="input-group-btn">  <asp:Button ID="Button2" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button2_Click" />
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#fm-modal-grid"><i class="fa fa-plus">Nuevo</i></button>               
                </span>
              </div>
        <div class="table table-responsive">
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IdMaestro" DataSourceID="ListaEmpleado" CssClass="table table-responsive-lg table-hover" AllowPaging="True" >
                  <Columns>                    
                      <asp:BoundField DataField="IdMaestro" HeaderText="IdMaestro" InsertVisible="False" ReadOnly="True" SortExpression="IdMaestro" />
                      <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                      <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                      <asp:BoundField DataField="Celular" HeaderText="Celular" SortExpression="Celular" />
                      <asp:BoundField DataField="FechaNacimiento" HeaderText="FechaNacimiento" SortExpression="FechaNacimiento" />
                      <asp:BoundField DataField="DPI" HeaderText="DPI" SortExpression="DPI" />
                      <asp:BoundField DataField="NombreP" HeaderText="NombreP" SortExpression="NombreP" />
                      <asp:CommandField ShowEditButton="True" />
                      <asp:CommandField ShowDeleteButton="True" />
                         </Columns>
              </asp:GridView>
            </div>
              <asp:SqlDataSource ID="ListaEmpleado" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT Maestro.IdMaestro, Maestro.Nombre, Maestro.Direccion, Maestro.Celular, Maestro.FechaNacimiento, Maestro.DPI, Puesto.NombreP FROM Maestro INNER JOIN Puesto ON Maestro.IdPuesto = Puesto.IdPuesto where Estado=1" UpdateCommand="UPDATE Maestro SET Nombre = @Nombre, Direccion = @Direccion, Celular = @Celular, FechaNacimiento = @FechaNacimiento, DPI = @DPI WHERE (IdMaestro = @IdMaestro)" DeleteCommand="Update Maestro set Estado=0" InsertCommand="INSERT INTO Maestro(Nombre, Direccion, Celular, FechaNacimiento, DPI, IdPuesto, Usuario, Contrasena,Estado) VALUES (@Nombre, @Direccion, @Celular, @FechaNacimiento, @DPI, @IdPuesto, @Usuario, @Contrasena,1)">
                  <InsertParameters>
                      <asp:Parameter Name="Nombre" />
                      <asp:Parameter Name="Direccion" />
                      <asp:Parameter Name="Celular" />
                      <asp:Parameter Name="FechaNacimiento" />
                      <asp:Parameter Name="DPI" />
                      <asp:Parameter Name="IdPuesto" />
                      <asp:Parameter Name="Usuario" />
                      <asp:Parameter Name="Contrasena" />
                  </InsertParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="Nombre" Type="String" />
                      <asp:Parameter Name="Direccion" Type="String" />
                      <asp:Parameter Name="Celular" />
                      <asp:Parameter Name="FechaNacimiento" />
                      <asp:Parameter Name="DPI" Type="Int64" />
                      <asp:Parameter Name="IdMaestro" />
                  </UpdateParameters>
              </asp:SqlDataSource>

       
                        
         <div class="modal fade" id="fm-modal-grid" tabindex="-1" role="dialog" aria-labelledby="fm-modal-grid" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Datos Docentes</h5>
								<button class="close" data-dismiss="modal" aria-label="Cerrar">
									<span aria-hidden="true">&times;</span>
								</button>
                    </div>

                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-sm-6">
                             <div class="form-group">
                            <label>DPI</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="dpi" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Nombre</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="nombre" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Fecha Nacimiento</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="apellido" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Telefono</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="telefono" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                              </div>
                           <div class="col-12 col-sm-6">
                                    
                             <div class="form-group">
                            <label>Direccion</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="direccion" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                        </div>
                               <div class="form-group">
                                   <label>Puesto</label>
                                     <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="NombreP" DataValueField="IdPuesto" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AsistenciaConnectionString %>" SelectCommand="SELECT [IdPuesto], [NombreP] FROM [Puesto]"></asp:SqlDataSource>
                               </div>
                              
                               <div class="form-group">
                                   <label>Usuario</label>
                                   <asp:TextBox ID="user" runat="server" CssClass="form-control"></asp:TextBox>
                               </div>
                               <div class="form-group">
                                   <label>Contrasena</label>
                                   <asp:TextBox ID="contra" runat="server" CssClass="form-control"></asp:TextBox>
                               </div>
                        
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button1_Click" />
								<button class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                
            </div>
        </div>
             </div>
             </div>


    </section>
</asp:Content>

