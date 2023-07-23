﻿using Citas_Medicas.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Base_Datos;

namespace Citas_Medicas
{
    public partial class WebForm4 : System.Web.UI.Page
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
            Fecha_Actual.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }
}