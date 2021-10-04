using Mini_Super_LaTica.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace Mini_Super_LaTica.Controllers
{
    public class ProductController : Connection
    {
        //Agregar un producto
        public void addProduct(ProductosModel productos)
        {
            Connect();
            try
            {
                SqlCommand comando = new SqlCommand("AddProducts", connection);
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.Parameters.Add(new SqlParameter("@Product_name", productos.Product_Name));
                comando.Parameters.Add(new SqlParameter("@Quantity", productos.Quantity));
                comando.Parameters.Add(new SqlParameter("@Description", productos.Description));
                comando.Parameters.Add(new SqlParameter("@UnitPrice", productos.UnitPrice));
                comando.Parameters.Add(new SqlParameter("@Image", productos.Imagen));
                comando.ExecuteNonQuery();
                comando.Dispose();

            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
            finally
            {
                Disconnect();
            }
        }
        //Metodo para cargarProductos por ID
        public DataSet GetProductById(int id)
        {
            DataSet ds = new DataSet();
            Connect();
            try
            {
                SqlCommand comando = new SqlCommand("GetProductByID", connection);
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.Parameters.Add(new SqlParameter("@Id", id));
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = comando;
                da.Fill(ds);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
            finally
            {
                Disconnect();
            }
            return ds;
        }
        //Listartodos los productos
        public List<ProductosModel> GetAllProducts()
        {
            List<ProductosModel> lista = new List<ProductosModel>();
            Connect();
            try
            {
                SqlCommand comando = new SqlCommand("GetAllProducts", connection);
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    ProductosModel producto = new ProductosModel()
                    {
                        Id = int.Parse(lector[0].ToString()),
                        Product_Name = lector[1].ToString(),
                        Quantity = int.Parse(lector[2].ToString()),
                        Description = lector[3].ToString(),
                        UnitPrice = int.Parse(lector[4].ToString()),
                        Imagen = (byte[])lector[5]

                    };
                    lista.Add(producto);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
            finally
            {
                Disconnect();
            }
            return lista;
        }
        //Agregar las ordenes
        public void AddOrder (OrderProducts order)
        {
            Connect();
            try
            {
                SqlCommand comando = new SqlCommand("AddOrder", connection);
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.Parameters.Add(new SqlParameter("@cantidadLess", order.cantidadLess));
                comando.Parameters.Add(new SqlParameter("@IdProducto", order.ProductID));
                comando.ExecuteNonQuery();
                comando.Dispose();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
            finally
            {
                Disconnect();
            }
        }
        public DataSet GetOrder()
        {
            DataSet ds = new DataSet();
            Connect();
            try
            {
                SqlCommand comando = new SqlCommand("GetOrderBuy", connection);
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(comando);
                da.Fill(ds);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
            finally
            {
                Disconnect();
            }

            return ds;
        }
    }
}