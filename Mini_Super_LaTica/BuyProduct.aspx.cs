using Mini_Super_LaTica.Controllers;
using Mini_Super_LaTica.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mini_Super_LaTica
{
    public partial class BuyProduct : System.Web.UI.Page
    {
        ProductController productController = new ProductController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarDropDowList();
                mostrarOrder();
            }
            
        }

        protected void btn_buyProduct_Click(object sender, EventArgs e)
        {
            OrderProducts order = new OrderProducts()
            {
                cantidadLess = int.Parse(txt_quantity.Text),
                ProductID = int.Parse(ddl_productos.SelectedValue)
            };
            productController.AddOrder(order);
            mostrarOrder();
            limpiarCampos();
        }
        public void mostrarOrder()
        {
            mostrarOrderCompra.DataSource = productController.GetOrder();
            mostrarOrderCompra.DataBind();
        }

        public void limpiarCampos()
        {
            txt_quantity.Text = string.Empty;
            ddl_productos.SelectedIndex = 0;
        }

        protected void LlenarDropDowList()
        {
            ddl_productos.DataSource = productController.GetAllProducts();
            ddl_productos.DataTextField = "Product_name";
            ddl_productos.DataValueField = "Id";
            ddl_productos.DataBind();
            ddl_productos.Items.Insert(0, new ListItem("Seleccionar un producto", "0"));
        }

        protected void mostrarOrderCompra_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Nombre del Producto";
                e.Row.Cells[1].Text = "Descripción";
                e.Row.Cells[2].Text = "Cantidad";
                e.Row.Cells[3].Text = "Precio";
            }
        }
    }
}