using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Base_Datos;
using Citas_Medicas.ServiceReference1;

namespace Citas_Medicas
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void createSesion(String Usuario, int Id)
        {
            Session["Usuario"] = Usuario;
            Session["Id"] = Id;
        }
        protected void btn_enviar_Click(object sender, EventArgs e)
        {
            string nom=nombre.Text;
            string ape=apellido.Text;
            string dir = direccion.Text;
            DateTime fec= new DateTime(1920, 1, 1);
            if (!string.IsNullOrEmpty(fec_nac.Text))
                DateTime.Parse(fec_nac.Text);
            string cor=correo.Text;
            string usu=usuario.Text;
            string con=new Password().Encriptar(contrasena.Text);
            Service1Client client = new Service1Client();
            int id = client.Registrarse(nom, ape, dir, fec, cor, usu, con);
            int rol = client.Rol_Usuario(id);
            createSesion(usu, id);
            switch (rol)
            {
                case 1:
                    break;
                case 2:
                    Response.Redirect("inicioDoc.aspx");
                    break;
                case 3:
                    Response.Redirect("inicioPaciente.aspx");
                    break;
            }
            Response.Redirect("Inicio.aspx");
        }
    }
}