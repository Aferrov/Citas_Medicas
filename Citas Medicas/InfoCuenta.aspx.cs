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
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_Datos();
            }
            loadSession();
                
        }

        private void Llenar_Datos()
        {
            int id = (int)(Session["Id"]);
            Service1Client client = new Service1Client();
            Paciente paciente = client.Datos_Paciente(id);
            nombre.Text=paciente.Nombre;
            apellido.Text=paciente.Apellido;
            direccion.Text=paciente.Direccion;
            DateTime fec = paciente.Fec_Nac;
            fec_nac.Text = fec.ToString("yyyy-MM-dd");
            correo.Text=paciente.Correo;
            cui.Text=paciente.CUI.ToString();
            vacunas.Text=paciente.VacunasCovid.ToString();
            sangre.Text = paciente.GrupoSanguineo;
            carrera.Text = paciente.Carrera;
        }
        private void loadSession()
        {
            String usuario = (String)(Session["Usuario"]);
            int id = (int)(Session["Id"]);
            Service1Client client = new Service1Client();
            Paciente paciente = client.Datos_Paciente(id);
            Cookie.Text= usuario;
            LabelNombre.Text = paciente.Nombre + " " + paciente.Apellido;
            LabelCorreo.Text = paciente.Correo;
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
            int cu = Convert.ToInt32(cui.Text);
            int vac = Convert.ToInt32(vacunas.Text);
            string san = sangre.Text;
            string car = carrera.Text;
            Service1Client client = new Service1Client();
            client.Actualizar_Paciente(id,nom, ape, dir, fec, cor, cu,vac,san, car);
        }
    }
}