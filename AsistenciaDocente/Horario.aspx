<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Horario.aspx.cs" Inherits="AsistenciaDocente.Horario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="content-header">
        <h1 align="center" >Horario Docentes</h1>
    </section>
    <section class="content">
              <div class="input-group custom-search-form">
                 <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
        <span class="input-group-btn">  <asp:Button ID="Button2" runat="server" Text="Buscar" CssClass="btn btn-default" OnClick="Button2_Click" />
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#fm-modal-grid"><i class="fa fa-plus">Nuevo</i></button>               
                </span>
              </div>





        <div class="table table-responsive">
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IdHorario" DataSourceID="ListaEmpleado" CssClass="table table-responsive-lg table-hover" AllowPaging="True" >
                  <Columns>                    
                      <asp:BoundField DataField="IdHorario" HeaderText="IdHorario" InsertVisible="False" ReadOnly="True" SortExpression="IdHorario" />
                      <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                      <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                      <asp:BoundField DataField="IdMaestro" HeaderText="IdMaestro" SortExpression="IdMaestro" />
                      <asp:BoundField DataField="IdTipoES" HeaderText="IdTipoES" SortExpression="IdTipoES" />
                         </Columns>
              </asp:GridView>
            </div>
              <asp:SqlDataSource ID="ListaEmpleado" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT Horario.* FROM Horario">
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
                            <label>Hora</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="hora" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label >Fecha</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="fecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                       
                        
                              </div>
                           <div class="col-12 col-sm-6">
                                    
                             
                               <div class="form-group">
                                   <label>Docente</label>
                                     <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="Nombre" DataValueField="IdMaestro" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AsistenciaConnectionString %>" SelectCommand="SELECT [IdMaestro], [Nombre] FROM [Maestro]"></asp:SqlDataSource>
                               </div>
                              
                              
                               
                                 <div class="form-group">
                                   <label>TiPo Entrada/Salida</label>
                                     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="TipoES" DataValueField="IdTipoES" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT [IdTipoES], [TipoES] FROM [TipoES]"></asp:SqlDataSource>
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

