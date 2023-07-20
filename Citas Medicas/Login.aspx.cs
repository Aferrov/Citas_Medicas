using Citas_Medicas.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Citas_Medicas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void createSesion(String Usuario, int Id)
        {
            Session["Usuario"] = Usuario;
            Session["Id"] = Id;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string u = usuario.Text;
            string c = contrasena.Text;
            Service1Client client = new Service1Client();
            bool correcto=client.Loguearse(u, c);
            if (correcto) 
            {
                int id = client.Id_Usuario(u);
                int rol = client.Rol_Usuario(id);
                createSesion(u, id);
                switch(rol)
                {
                    case 1 :
                        break;
                    case 2 :
                        Response.Redirect("inicioDoc.aspx");
                        break;
                    case 3 :
                        Response.Redirect("inicioPaciente.aspx");
                        break;
                }
                
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Usuario o contraseña incorrectos');", true);
            }
        }
    }
}