<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="Mini_Super_LaTica.AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center my-4">Agregando Productos</h2>
    <form id="form_addProduct" class="col-12">
        <section class="form-group row my-3">
            <label for="txt_productName" class="form-label col-sm-2">Nombre del Producto:</label>
            <asp:TextBox ID="txt_productName" runat="server" CssClass="form-control col-sm"></asp:TextBox>
        </section>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_productName" ErrorMessage="Este campo es requerido" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="ReGexProductName" runat="server" ControlToValidate="txt_productName"
                ErrorMessage="Escribe solo letras por favor" CssClass="alert alert-danger"
                ValidationExpression="^[a-zA-Z\s]{2,254}" ValidateEmptyText="True"></asp:RegularExpressionValidator>
        <section class="form-group row my-3">
            <label class="form-label col-sm-2" for="txt_quantity">Cantidad:</label>
            <asp:TextBox ID="txt_quantity" runat="server" CssClass="form-control col-sm"></asp:TextBox>
        </section>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_quantity" SetFocusOnError="true" ErrorMessage="Este campo es requerido" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="ReGextxt_quantity" runat="server" ControlToValidate="txt_quantity"
                ErrorMessage="Escriba solo números en este campo" CssClass="alert alert-danger"
                ValidationExpression="^\d*$" SetFocusOnError="true"></asp:RegularExpressionValidator>
        <section class="form-group row my-3">
            <label class="form-label col-sm-2" for="txt_description">Descripción::</label>
            <asp:TextBox ID="txt_description" runat="server" Rows="3" CssClass="form-control col-sm"></asp:TextBox>
        </section>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" ControlToValidate="txt_description" ErrorMessage="Este campo es requerido" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
        <section class="form-group row my-3">
            <label class="form-label col-sm-2" for="txt_unitPrice">Precio:</label>
            <asp:TextBox ID="txt_unitPrice" runat="server" CssClass="form-control col-sm"></asp:TextBox>
        </section>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" SetFocusOnError="true" runat="server" ControlToValidate="txt_unitPrice" ErrorMessage="Este campo es requerido" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="ReGeztxt_unitPrice" runat="server" SetFocusOnError="true" ControlToValidate="txt_unitPrice"
                ErrorMessage="Escriba solo números en este campo" CssClass="alert alert-danger"
                ValidationExpression="^\d*$" ValidateEmptyText="True"></asp:RegularExpressionValidator>
        <section class="form-group row my-3">
            <label class="form-label col-sm-2" for="flu_image">Selecione un imagen::</label>
            <asp:FileUpload ID="flu_image" runat="server" CssClass="form-control-file col-sm" />            
        </section>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true" ControlToValidate="flu_image" ErrorMessage="Este campo es requerido" CssClass="alert alert-danger"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="ReGexflu_image" runat="server" SetFocusOnError="true" ControlToValidate="flu_image"
                ErrorMessage="Solo se permiten extensiones (.jpg,.png,.jpeg,.gif,.jfif)"  CssClass="alert alert-danger"
                ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|jfif|JPG|JPEG|PNG|GIF|JFIF)$" ValidateEmptyText="True"></asp:RegularExpressionValidator>
        <section class="d-flex justify-content-end">
            <asp:Button ID="btn_addProduct" runat="server" CssClass="btn btn-success " Text="Agregar Producto" OnClick="btn_addProduct_Click" />
        </section>
    </form>
</asp:Content>
