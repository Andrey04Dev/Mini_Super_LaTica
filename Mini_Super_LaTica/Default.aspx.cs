using Mini_Super_LaTica.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mini_Super_LaTica
{
    public partial class _Default : Page
    {
        ProductController productController = new ProductController();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            mostrarProductos();
        }

        private void mostrarProductos()
        {
            try
            {
                RepetirProducto.DataSource = productController.GetAllProducts();
                RepetirProducto.DataBind();

            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
        }
    }
}