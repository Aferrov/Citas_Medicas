using Citas_Medicas.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using Base_Datos;

namespace Citas_Medicas
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadSession();
            llenarTabla();
        }
        private void loadSession()
        {
            String usuario = (String)(Session["Usuario"]);
            int id = (int)(Session["Id"]);
            Service1Client client = new Service1Client();
            Paciente paciente = client.Datos_Paciente(id);
       
            LabelNombre.Text = paciente.Nombre+" "+paciente.Apellido;
            LabelNombre2.Text = paciente.Nombre + " " + paciente.Apellido;
            LabelCorreo.Text = paciente.Correo;
            Fecha_Actual.Text= DateTime.Now.ToString("yyyy-MM-dd");
        }

        private void llenarTabla()
        {
            int id = (int)(Session["Id"]);
            DateTime fecha = DateTime.Now;
            Service1Client client = new Service1Client();
            IList<Cita> citas = client.Citas_Paciente(id, fecha.Day.ToString("D2"), fecha.Month.ToString("D2"), fecha.Year.ToString());
            int n = 1;
            foreach (Cita c in citas)
            {
                TableRow tableRow = new TableRow();
                TableCell counterCell = new TableCell();
                counterCell.Text = n.ToString();
                tableRow.Cells.Add(counterCell);

                TableCell tableCell1 = new TableCell();
                tableCell1.Text = c.Especialidad;
                tableRow.Cells.Add(tableCell1);

                TableCell tableCell2 = new TableCell();
                tableCell2.Text = c.Fecha;
                tableRow.Cells.Add(tableCell2);

                citas_paciente.Rows.Add(tableRow);
                n++;
            }
            
        }
    }
}