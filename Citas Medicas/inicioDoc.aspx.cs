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
    public partial class WebForm3 : System.Web.UI.Page
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
            Doctor doctor = client.Datos_Medico(id);
            Cookie.Text= usuario;
            LabelNombre.Text = doctor.Nombre + " " + doctor.Apellido;
            LabelNombre2.Text = doctor.Nombre + " " + doctor.Apellido;
            LabelCorreo.Text = doctor.Correo;
            fechaActual.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        private void llenarTabla()
        {
            int id = (int)(Session["Id"]);
            DateTime fecha=DateTime.Now;
            Service1Client client = new Service1Client();
            IList<Cita> citas = client.Citas_Medico(id, fecha.Day.ToString("D2"), fecha.Month.ToString("D2"),fecha.Year.ToString());
            int n = 1;
            foreach (Cita c in citas)
            {
                TableRow tableRow = new TableRow();
                TableCell counterCell = new TableCell();
                counterCell.Text = n.ToString();
                tableRow.Cells.Add(counterCell);

                TableCell tableCell1 = new TableCell();
                tableCell1.Text = c.Paciente;
                tableRow.Cells.Add(tableCell1);

                TableCell tableCell2 = new TableCell();
                tableCell2.Text = c.Fecha;
                tableRow.Cells.Add(tableCell2);

                Button verButton = new Button();
                verButton.Text = "Ver";
                verButton.Click += VerButton_Click;
                Button cancelButton = new Button();
                cancelButton.Text = "Cancelar";
                cancelButton.Click += CancelButton_Click;
                TableCell ButtonCell = new TableCell();
                ButtonCell.Controls.Add(verButton);
                ButtonCell.Controls.Add(cancelButton);  
                tableRow.Cells.Add(ButtonCell);
                tableRow.CssClass = "texto";


                citas_medico.Rows.Add(tableRow);
                n++;
            }

        }
        private void VerButton_Click(object sender, EventArgs e)
        {
            informacion.Style["display"] = "block";
        }
        private void CancelButton_Click(object sender, EventArgs e)
        {
            informacion.Style["display"] = "none";
        }
    }
}