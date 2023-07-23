using Base_Datos;
using Citas_Medicas.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Citas_Medicas
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_Especialidades();
                
                Llenar_Datos();
            }
            loadSession();
        }

        private void Llenar_Especialidades()
        {
            Service1Client client = new Service1Client();
            IList<Especialidad> especialidades = client.Especialidades();

            list_esp.DataSource = especialidades;
            list_esp.DataTextField = "NEspecialidad"; 
            list_esp.DataValueField = "Id";
            list_esp.DataBind();
        }
        private void Llenar_Datos()
        {
            int id = (int)(Session["Id"]);
            Service1Client client = new Service1Client();
            Doctor doc = client.Datos_Medico(id);
            nombre.Text = doc.Nombre;
            apellido.Text = doc.Apellido;
            direccion.Text = doc.Direccion;
            DateTime fec = doc.FechaNacimiento;
            fec_nac.Text = fec.ToString("yyyy-MM-dd");
            correo.Text = doc.Correo;
        }
        private void loadSession()
        {
            String usuario = (String)(Session["Usuario"]);
            int id = (int)(Session["Id"]);
            Service1Client client = new Service1Client();
            Doctor doc = client.Datos_Medico(id);

            LabelNombre.Text = doc.Nombre + " " + doc.Apellido;
            LabelCorreo.Text = doc.Correo;
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            int id = (int)(Session["Id"]);
            string nom = nombre.Text;
            string ape = apellido.Text;
            string dir = direccion.Text;
            DateTime fec = new DateTime(1920, 1, 1);
            if (!string.IsNullOrEmpty(fec_nac.Text))
                fec=DateTime.Parse(fec_nac.Text);
            string cor = correo.Text;
            int espe = Convert.ToInt32(list_esp.SelectedValue);
            
            Service1Client client = new Service1Client();
            client.Actualizar_Medico(id, nom, ape, dir, fec, cor, espe);
        }
    }
}