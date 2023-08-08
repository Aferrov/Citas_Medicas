using Citas_Medicas.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Base_Datos;
using System.Net.Mail;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;

namespace Citas_Medicas
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        public static IList<Cita> citas;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                citas= new List<Cita>();
                
            }
            llenarTabla();
            loadSession();
        }

        private void loadSession()
        {
            String usuario = (String)(Session["Usuario"]);
            int id = (int)(Session["Id"]);
            Service1Client client = new Service1Client();
            Doctor doctor = client.Datos_Medico(id);
            Cookie.Text= usuario;
            LabelNombre.Text = doctor.Nombre + " " + doctor.Apellido;
            LabelCorreo.Text = doctor.Correo;
            fechaActual.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        private void EnviarCorreo(int id, string fecha)
        {
            Service1Client client = new Service1Client();
            string correo=client.Correo_Usuario(id);

            try
            {
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
                smtpClient.UseDefaultCredentials= false;
                smtpClient.Port = 25; 
                smtpClient.Credentials = new NetworkCredential("citasmedicas89@gmail.com", "citasmed89");
                smtpClient.EnableSsl = true;

                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("citasmedicas89@gmail.com");
                mailMessage.To.Add(correo);
                mailMessage.Subject = "Cita cancelada";
                mailMessage.Body = "Por este medio te comunicamos que tu cita del "+ fecha +" fue cancelada.";

                smtpClient.Send(mailMessage);

                Response.Write("Correo enviado exitosamente.");
            }
            catch (Exception ex)
            {
                Response.Write("Error al enviar el correo: " + ex.Message);
            }
        }
        private void llenarTabla()
        {
            int id = (int)(Session["Id"]);
            Service1Client client = new Service1Client();
            citas = client.Citas_Medico(id, null, null, null);
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
                if(c.Estado==false)
                {
                    tableRow.BackColor = System.Drawing.Color.Red;
                    cancelButton.Enabled = false;
                }
                tableRow.CssClass = "texto";
                citas_medico.Rows.Add(tableRow);
                n++;
            }

        }

        private void LlenarInformacion(int c)
        {

        }
        private void VerButton_Click(object sender, EventArgs e)
        {
            informacion.Style["display"] = "block";
            Button verButton = (Button)sender;
            TableCell cell = (TableCell)verButton.Parent;
            TableRow row = (TableRow)cell.Parent;
            int rowIndex = citas_medico.Rows.GetRowIndex(row);
            int citaId = citas[rowIndex-1].Id;
            int idpac= citas[rowIndex - 1].PacienteId;
            Service1Client client = new Service1Client();
            Paciente paciente = client.Datos_Paciente(idpac);
            idcita.Text = citaId.ToString();
            nombre.Text = citas[rowIndex-1].Paciente.ToString();
            vacunas.Text = paciente.VacunasCovid.ToString();
            sangre.Text = paciente.GrupoSanguineo;
            diagnostico.Text = citas[rowIndex - 1].Diagnostico.ToString(); ;
            
        }
        private void CancelButton_Click(object sender, EventArgs e)
        {
            Button cancelButton = (Button)sender;
            TableCell cell = (TableCell)cancelButton.Parent;
            TableRow row = (TableRow)cell.Parent;
            int rowIndex = citas_medico.Rows.GetRowIndex(row);
            int citaId = citas[rowIndex - 1].Id;
            int pacId = citas[rowIndex - 1].PacienteId;
            string fecha= citas[rowIndex - 1].Fecha;
            Service1Client client = new Service1Client();
            client.Update_Cita(citaId, false, null);
            row.BackColor = System.Drawing.Color.Red;
            cancelButton.Enabled = false;
            //EnviarCorreo(pacId,fecha);
        }
        protected void btn_Cerrar_Click(object sender, EventArgs e)
        {
            informacion.Style["display"] = "none";
        }
        protected void btn_Editar_Click(object sender, EventArgs e)
        {
            int citaId = Convert.ToInt32(idcita.Text);
            Service1Client client = new Service1Client();
            string diag=diagnostico.Text;
            client.Update_Cita(citaId, true, diag);
        }
    }
}