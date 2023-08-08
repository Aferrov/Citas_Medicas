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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                llenarTabla();
            }
            loadSession();
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
            Fecha_Actual.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
        private void llenarTabla()
        {
            int id = (int)(Session["Id"]);
            DateTime fecha = DateTime.Now;
            Service1Client client = new Service1Client();
            IList<Cita> citas = client.Citas_Paciente(id, null,null,null);
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

                TableCell tableCell3 = new TableCell();
                tableCell3.Text = c.Diagnostico;
                tableRow.Cells.Add(tableCell3);

                tableRow.CssClass = "texto";
                citas_paciente.Rows.Add(tableRow);
                n++;
            }

        }
    }
}