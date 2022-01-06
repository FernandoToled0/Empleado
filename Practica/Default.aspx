<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Practica._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Empleados</h1>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:LinkButton runat="server" class="btn btn-primary" OnClientClick="abrirmodal()" ID="nuevo_empleado">Nuevo Empleado</asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div class="row">
        <div class="col-md-12">

            <h2>Datos de empleados</h2>
            <p>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                         <asp:TextBox ID="buscarEmpleado" runat="server" CssClass="form-control form-control-sm" placeholder="Ingrese un nombre o dpi" AutoPostBack="true"></asp:TextBox><br />

                        <asp:GridView ID="grdEmpleado" runat="server" DataSourceID="SqlEmpleados" CssClass="table table-sm table-hover" GridLines="None" AutoGenerateColumns="False" DataKeyNames="dpi" AllowSorting="True">
                            <Columns>
                                <asp:BoundField DataField="dpi" HeaderText="DPI" ReadOnly="True" SortExpression="dpi"></asp:BoundField>
                                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre"></asp:BoundField>
                                <asp:BoundField DataField="apellidos" HeaderText="Apellidos" SortExpression="apellidos"></asp:BoundField>
                                <asp:BoundField DataField="cod_depto" HeaderText="Codigo de departamento" SortExpression="cod_depto"></asp:BoundField>
                                <asp:BoundField DataField="nombre_depto" HeaderText="Nombre de departamento" SortExpression="nombre_depto"></asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandName="editar" OnClientClick="abrirmodal()">Editar</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandName="eliminar">Eliminar</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                     <asp:SqlDataSource runat="server" ID="SqlEmpleados" ConnectionString='<%$ ConnectionStrings:strEmpresa %>' SelectCommand="consulta_dato_empleado" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="actualizarEmpleado" />
                        <asp:AsyncPostBackTrigger ControlID="crearEmpleado" />
                    </Triggers>
                </asp:UpdatePanel>
            </p>
        </div>

    </div>

    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Datos del empleado</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Nombre:</label>
                                    <asp:TextBox ID="nombre" runat="server" CssClass="form-control form-control-sm" placeholder="Ingrese un nombre"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label>Apellido:</label>
                                    <asp:TextBox ID="apellido" runat="server" CssClass="form-control form-control-sm" placeholder="Ingrese un apellido"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>DPI:</label>
                                    <asp:TextBox ID="dpi" runat="server" CssClass="form-control form-control-sm" placeholder="DPI"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label>Departamento:</label>
                                    <asp:DropDownList ID="departamento" CssClass="form-control form-control-sm" runat="server" DataSourceID="SqlDepartamento" DataTextField="nombre_depto" DataValueField="codigo_departamento"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDepartamento" ConnectionString='<%$ ConnectionStrings:strEmpresa %>' SelectCommand="SELECT [codigo_departamento], [nombre_depto] FROM [departamento]"></asp:SqlDataSource>

                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="grdEmpleado" />
                            <asp:AsyncPostBackTrigger ControlID="nuevo_empleado" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>

                <div class="modal-footer">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                            <asp:Button ID="crearEmpleado" class="btn btn-primary" runat="server" Text="Crear nuevo empleado" Visible="false" OnClientClick="cerrarrmodal()"/>
                            <asp:Button ID="actualizarEmpleado" class="btn btn-primary" runat="server" Text="Actualizar datos empleado" Visible="false" OnClientClick="cerrarrmodal()" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="nuevo_empleado" />
                            <asp:AsyncPostBackTrigger ControlID="grdEmpleado" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

    <script>
        function abrirmodal() {
            $('#staticBackdrop').modal('show')
        }

        function cerrarrmodal() {
            $('#staticBackdrop').modal('hide')
        }
    </script>
</asp:Content>
