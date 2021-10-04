using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mini_Super_LaTica.Models
{
    public class ProductosModel
    {
        public int Id { get; set; }
        public string Product_Name { get; set; }
        public int Quantity { get; set; }
        public string Description { get; set; }
        public int UnitPrice { get; set; }
        public byte[] Imagen { get; set; }
    }
}