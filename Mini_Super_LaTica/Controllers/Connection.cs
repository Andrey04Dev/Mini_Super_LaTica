using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Mini_Super_LaTica.Controllers
{
    public class Connection
    {
        protected SqlConnection connection;
        protected void Connect()
        {
            try
            {
                connection = new SqlConnection("Data Source=DESKTOP-2DTB5IH; Initial Catalog=bd_minisuper;Integrated Security= True");
                connection.Open();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
        }

        protected void Disconnect()
        {
            try
            {
                connection.Close();
                connection.Dispose();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
        }
    }
}