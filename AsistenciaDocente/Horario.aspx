<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Horario.aspx.cs" Inherits="AsistenciaDocente.Horario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="content-header">
        <h1 align="center" >Horario Docentes</h1>
    </section>
    <section class="content">
              <div class="input-group custom-search-form">
                  <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="IdMaestro"></asp:DropDownList>
                  <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AsistenciaConnectionString %>" SelectCommand="SELECT [IdMaestro], [Nombre] FROM [Maestro] WHERE ([Estado] = 1)">
                  </asp:SqlDataSource>
        <span class="input-group-btn">  <asp:Button ID="Button2" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button2_Click" />
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#fm-modal-grid"><i class="fa fa-plus">Nuevo</i></button>               
                </span>
              </div>





        <div class="table table-responsive">
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ListaEmpleado" CssClass="table table-responsive-lg table-hover" AllowPaging="True" >
                  <Columns>                    
                      <asp:BoundField DataField="Hentrada" HeaderText="Hentrada" SortExpression="Hentrada" />
                      <asp:BoundField DataField="Hsalida" HeaderText="Hsalida" SortExpression="Hsalida" />
                      <asp:BoundField DataField="NombreD" HeaderText="NombreD" SortExpression="NombreD" />
                      <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                         </Columns>
              </asp:GridView>
            </div>
              <asp:SqlDataSource ID="ListaEmpleado" runat="server" ConnectionString="<%$ ConnectionStrings:AsistenciaConnectionString %>" SelectCommand="SELECT DetalleDiaMaestro.Hentrada, DetalleDiaMaestro.Hsalida, Dia.NombreD, Jornada.Nombre FROM DetalleDiaMaestro INNER JOIN Dia ON DetalleDiaMaestro.IdDia = Dia.IdDia INNER JOIN Jornada ON DetalleDiaMaestro.IdJornada = Jornada.IdJornada INNER JOIN Maestro ON DetalleDiaMaestro.IdMaestro = Maestro.IdMaestro INNER JOIN Puesto ON Maestro.IdPuesto = Puesto.IdPuesto WHERE (Maestro.IdMaestro = @IdMaestro)" InsertCommand="INSERT INTO DetalleDiaMaestro(Hentrada, Hsalida, IdJornada, IdDia, IdMaestro) VALUES (@Hs, @He, @IdJ, @IdD, @IdM)">
                  <InsertParameters>
                      <asp:Parameter Name="Hs" />
                      <asp:Parameter Name="He" />
                      <asp:Parameter Name="IdJ" />
                      <asp:Parameter Name="IdD" />
                      <asp:Parameter Name="IdM" />
                  </InsertParameters>
                  <SelectParameters>
                      <asp:ControlParameter ControlID="DropDownList4" Name="IdMaestro" PropertyName="SelectedValue" />
                  </SelectParameters>
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
                                  <div class="form-group">
                                   <label>Docente</label>
                                      <asp:Label ID="Label1" runat="server" CssClass="form-control" Text=""></asp:Label>
                              </div>
                                <div class="col-12 col-sm-6">
                             <div class="form-group">
                            <label>Hora entrada</label>
                            <asp:TextBox ID="hora" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                            </div>
                            <div class="form-group">
                            <label >Hora Salida</label>
                            <asp:TextBox ID="salida" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                            </div>
                              </div>
                           <div class="col-12 col-sm-6">
                               
                                 <div class="form-group">
                                   <label>Dia</label>
                                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NombreD" DataValueField="IdDia" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT [IdDia], [NombreD] FROM [Dia]"></asp:SqlDataSource>
                               </div>

                         <div class="form-group">
                                   <label>Jornada</label>
                                     <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="IdJornada" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT [IdJornada], [Nombre] FROM [Jornada]"></asp:SqlDataSource>
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

