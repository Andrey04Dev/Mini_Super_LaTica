<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BuyProduct.aspx.cs" Inherits="Mini_Super_LaTica.BuyProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center">Comprar un Producto</h2>
    <form id="form_buyProduct">
        <section class="form-group row my-3">
            <label class="form-label col-sm-2" for="txt_codigo">Selección del producto:</label>
            <asp:DropDownList ID="ddl_productos" CssClass="form-control col-sm" runat="server"></asp:DropDownList>
        </section>
        <section class="form-group row my-3">
            <label class="form-label col-sm-2" for="txt_quantity">Digite la cantidad:</label>
            <asp:TextBox ID="txt_quantity" runat="server" CssClass="form-control col-sm"></asp:TextBox>
        </section>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_quantity" ErrorMessage="Estos campos son requeridos" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
        <section class="d-flex justify-content-end">
            <asp:Button ID="btn_buyProduct" runat="server" CssClass="btn btn-primary " Text="Comprar Producto" OnClick="btn_buyProduct_Click" />
        </section>
    </form>
    <div class="mt-3">
        <h2 class="text-center flex-column">Orden de compra</h2>
        <section class="d-flex justify-content-center mt-3">
            <asp:GridView ID="mostrarOrderCompra" CssClass="table table-hover thead-dark table-responsive w-100" runat="server"
                onrowdatabound="mostrarOrderCompra_RowDataBound"></asp:GridView>
        </section>
    </div>
</asp:Content>
