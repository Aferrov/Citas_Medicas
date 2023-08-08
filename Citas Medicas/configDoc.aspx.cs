using Citas_Medicas.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Base_Datos;

namespace Citas_Medicas
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
               loadSession(); 
            }
            
        }

        private void loadSession()
        {
            String usuario = (String)(Session["Usuario"]);
            if(Request.Cookies[usuario]!= null)
            {
                String cookie = Request.Cookies[usuario].Value;
                if (cookie=="True")
                {
                    CheckDark.Checked= true;
                }
                else
                    CheckDark.Checked = false;
            }
            
            int id = (int)(Session["Id"]);
            Service1Client client = new Service1Client();
            Doctor doctor = client.Datos_Medico(id);
            Cookie.Text= usuario;
            LabelNombre.Text = doctor.Nombre + " " + doctor.Apellido;
            LabelCorreo.Text = doctor.Correo;
            fechaActual.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        private void createCookie(String dark)
        {
            String usuario = (String)(Session["Usuario"]);
            HttpCookie cookie1 = new HttpCookie(usuario, dark);
            Response.Cookies.Add(cookie1);

        }
        protected void CheckDark_CheckedChanged(object sender, EventArgs e)
        {
            String usuario = (String)(Session["Usuario"]);
            bool activado = CheckDark.Checked;
            createCookie(activado.ToString());
            string script = ""+usuario+"();";
            ClientScript.RegisterStartupScript(this.GetType(), "miFuncionScript", script, true);
        }
    }
}