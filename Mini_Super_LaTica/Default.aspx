<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mini_Super_LaTica._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center">Bienvenidos a  Mini Super La Tica Online</h2>
    <div class="row">
        <asp:Repeater ID="RepetirProducto" runat="server">
            <ItemTemplate>
                <div class="col-sm-12 col-md-6 col-lg-3 my-2">
                <article class="card h-100">
                    <img class="card-img-top h-50" src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"Imagen")) %>" />
                    <section class="card-body text-center">
                        <div class="row d-flex justify-content-around">
                            <h3 class="card-title"><%# DataBinder.Eval(Container.DataItem,"Product_name") %></h3>
                        </div>
                        <section class="row d-flex justify-content-around">
                            <p class="font-weight-bold"">Descripción:</p>
                            <p class="card-text"><%# DataBinder.Eval(Container.DataItem,"Description") %></p>
                        </section>
                        <section class="row d-flex justify-content-around">
                            <p class="font-weight-bold">Cantidad:</p>
                            <span><%# DataBinder.Eval(Container.DataItem,"Quantity") %></span>
                        </section>
                        <section class="row d-flex justify-content-around">
                            <p class="font-weight-bold">Precio:</p>
                            <span><%# DataBinder.Eval(Container.DataItem,"UnitPrice")%></span>
                        </section>
                    </section>
                    <asp:Button ID="btn_addCart" runat="server" CssClass="btn btn-primary m-3" Text="Agregar al Carrito" PostBackUrl="~/BuyProduct.aspx" />
                </article>
                    </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
