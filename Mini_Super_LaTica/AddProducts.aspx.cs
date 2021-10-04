using Mini_Super_LaTica.Controllers;
using Mini_Super_LaTica.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Mini_Super_LaTica
{
    public partial class AddProducts : System.Web.UI.Page
    {
        ProductController productList = new ProductController();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_addProduct_Click(object sender, EventArgs e)
        {
            ValidarCampos();
            //Obtiendo datos de la imagen que vamos a subir
            if (flu_image.HasFile == true)
            {
                int tamaño = flu_image.PostedFile.ContentLength;
                byte[] imagenOriginal = new byte[tamaño];
                flu_image.PostedFile.InputStream.Read(imagenOriginal, 0, tamaño);
                //Transformamos la imagen a binario para guardarla en la BD.
                Bitmap imagenOriginalBinaria = new Bitmap(flu_image.PostedFile.InputStream);
                //Empezamos a reducir la imagen a un tamaño estandar
                System.Drawing.Image imgReducida;
                int tamañoReducido = 250;
                imgReducida = RedimencionarImagen(imagenOriginalBinaria, tamañoReducido);
                byte[] smallImgReducida = new byte[tamañoReducido];
                //Convertimos la imagen
                ImageConverter convertidor = new ImageConverter();
                smallImgReducida = (byte[])convertidor.ConvertTo(imgReducida, typeof(byte[]));

                //Agregamos la información a la base de datos
                ProductosModel product = new ProductosModel()
                {
                    Product_Name = txt_productName.Text,
                    Quantity = int.Parse(txt_quantity.Text),
                    Description = txt_description.Text,
                    UnitPrice = int.Parse(txt_unitPrice.Text),
                    Imagen = smallImgReducida
                };
                productList.addProduct(product);
                LimpiarCampos();
            }
        }
        //Creación de procedimientos que voy a ocupar
        /*Con esta función hacemos la imagen más pequeña
        en byte para que no dure mucho en subir*/
        public System.Drawing.Image RedimencionarImagen(System.Drawing.Image ImagenOriginal, int alto)
        {
            var radio = (double)alto / ImagenOriginal.Height;
            var NuevoAncho = (int)(ImagenOriginal.Width * radio);
            var NuevoAlto = (int)(ImagenOriginal.Height * radio);
            var NuevaImagen = new Bitmap(NuevoAncho, NuevoAlto);
            var g = Graphics.FromImage(NuevaImagen);
            g.DrawImage(ImagenOriginal, 0, 0, NuevoAlto, NuevoAlto);
            return NuevaImagen;
        }
        public void LimpiarCampos()
        {
            txt_productName.Text = string.Empty;
            txt_description.Text = string.Empty;
            txt_quantity.Text = string.Empty;
            txt_unitPrice.Text = string.Empty;
        }
        public void ValidarCampos()
        {
            if (txt_productName.Text == "" || txt_description.Text == "" ||
                txt_quantity.Text == "" || txt_unitPrice.Text == "" || flu_image.HasFile == false)
            {
                ReGexProductName.ErrorMessage = "Este espacio es requirido";
                ReGextxt_quantity.ErrorMessage = "Este espacio es requirido";
                ReGeztxt_unitPrice.ErrorMessage = "Este espacio es requirido";
                ReGexflu_image.ErrorMessage = "Este espacio es requerido";
            }
        }
    }
}