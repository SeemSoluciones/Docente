<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Jornada.aspx.cs" Inherits="AsistenciaDocente.Jornada" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="content-header">
        <h1 align="center" >Jornada</h1>        
        </section>
    
    <section class="content">
    <div class="box box-primary">
        <div class="box-header">
            <div class="box-tools">
                
               </div>
        </div>

                        


        <div class="box-body">
            <div class="input-group custom-search-form">
                 <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
        <span class="input-group-btn">  <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn bg-navy" OnClick="Button1_Click" />
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#fm-modal-grid"><i class="fa fa-plus">Nuevo</i></button>               
                </span>
              </div>
            <div class="table">
             <asp:GridView ID="GridView1"  runat="server" AllowPaging="True" AutoGenerateColumns="False"  CssClass="table table-responsive" DataKeyNames="IdJornada" DataSourceID="SqlDataSource1">
                 <Columns>
                     
                     <asp:BoundField DataField="IdJornada" HeaderText="IdJornada" ReadOnly="True" SortExpression="IdJornada" InsertVisible="False" />
                     <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                     <asp:BoundField DataField="NombreAbreviado" HeaderText="NombreAbreviado" SortExpression="NombreAbreviado" />
                     <asp:CommandField ShowEditButton="True" />
                     <asp:CommandField ShowDeleteButton="True"  />
                   
                 </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT Jornada.* FROM Jornada" DeleteCommand="DELETE FROM Jornada WHERE (IdJornada = @IdJornada)  " InsertCommand="INSERT INTO Jornada(Nombre, NombreAbreviado) VALUES (@Nombre, @NombreAbreviado)" UpdateCommand="UPDATE Jornada SET Nombre = @Nombre, NombreAbreviado = @NombreAbreviado WHERE (IdJornada = @IdJornada)">
                    <DeleteParameters>
                        <asp:Parameter Name="IdJornada" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nombre" />
                        <asp:Parameter Name="NombreAbreviado" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" />
                        <asp:Parameter Name="NombreAbreviado" />
                        <asp:Parameter Name="IdJornada" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        </div>
           
        </div>
        </div>
        <div class="modal fade" id="fm-modal-grid" tabindex="-1" role="dialog" aria-labelledby="fm-modal-grid" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">DATOS</h5>
								<button class="close" data-dismiss="modal" aria-label="Cerrar">
									<span aria-hidden="true">&times;</span>
								</button>
                    </div>

                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-sm-12">
                                    <div>
                                        <label>Nombre</label>
                                        <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                     <div class="form-group">
                            <label>Abreviación</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                       
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="Button3" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="200" OnClick="Button3_Click" />
								<button class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>

