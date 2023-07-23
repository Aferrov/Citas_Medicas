using Base_Datos;
using Citas_Medicas.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Citas_Medicas
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadSession();
        }

        private void loadSession()
        {
            String usuario = (String)(Session["Usuario"]);
            int id = (int)(Session["Id"]);
            Service1Client client = new Service1Client();
            Paciente paciente = client.Datos_Paciente(id);

            LabelNombre.Text = paciente.Nombre + " " + paciente.Apellido;
            LabelCorreo.Text = paciente.Correo;
        }

        protected void ButtonCambiar_Click(object sender, EventArgs e)
        {
            int id = (int)(Session["Id"]);
            string contra = TextContraNue.Text;
            Password pas = new Password();
            contra = pas.Encriptar(contra);
            Service1Client client = new Service1Client();
            client.Cambiar_Contraseña(id,contra);

        }

        
    }
}