using Citas_Medicas.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Base_Datos;
using System.Drawing;
using System.Web.Services.Description;
using System.Web.UI.WebControls.WebParts;
using System.Security.Cryptography;

namespace Citas_Medicas
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadSession();
                llenarLista();
                llenarTabla();
                RecorrerTabla();
            }
            else
            {
                llenarTabla();
            }
            

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
        
        private void llenarLista()
        {
            Service1Client client = new Service1Client();
            IList<Especialidad> especialidades = client.Especialidades();

            list_especialidades.DataSource = especialidades;
            list_especialidades.DataTextField = "NEspecialidad";
            list_especialidades.DataValueField = "Id";
            list_especialidades.DataBind();
        }
        private void llenarTabla()
        {
            DateTime horaBase = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 8, 30, 0);
            int filas = 22;
            int columnas = 6;
            
            for(int k=0;k<filas;k++)
            {
                TableRow fila = new TableRow();

                TableCell celda = new TableCell();
                celda.Text = horaBase.ToString("HH:mm");

                fila.Cells.Add(celda);
                for (int j = 1; j < columnas; j++)
                {
                    TableCell celda2 = new TableCell();

                    fila.Cells.Add(celda2);
                }

                horaBase = horaBase.AddMinutes(15);

                TableHorario.Rows.Add(fila);
            }
            
        }
        
        protected DateTime ObtenerFechaLunes()
        {
            DateTime hoy = DateTime.Today;
            int numeroDiaSemana = (int)hoy.DayOfWeek;
            int diasHastaLunes = ((int)DayOfWeek.Monday - numeroDiaSemana + 7) % 7;
            DateTime fechaLunes = hoy.AddDays(diasHastaLunes);
            return fechaLunes;
        }

        private void AsignarTextoACelda(string hora, string dia, string texto)
        {
            // Encuentra la fila correspondiente a la hora en la tabla
            TableRow filaHora = null;
            foreach (TableRow fila in TableHorario.Rows)
            {
                string horaEnCelda = fila.Cells[0].Text; // Suponemos que la hora está en la primera celda de cada fila
                if (horaEnCelda == hora)
                {
                    filaHora = fila;
                    break;
                }
            }

            if (filaHora != null)
            {
                int columnaDia = ObtenerColumnaDia(Convert.ToInt32(dia));
                if (columnaDia >= 0 && columnaDia < filaHora.Cells.Count)
                {
                    filaHora.Cells[columnaDia].Text = texto;
                    filaHora.Cells[columnaDia].BackColor = Color.Red;
                }
            }
        }

        private int ObtenerColumnaDia(int dia)
        {
            /*DateTime lunes = ObtenerFechaLunes();
            return (dia - lunes.Day) + 1;*/
            return (dia - 10) + 1;
        }
        protected void RecorrerTabla()
        {
            int esp = Convert.ToInt32(list_especialidades.SelectedValue);
            //DateTime lunes = ObtenerFechaLunes();
            //DateTime viernes = lunes.AddDays(5);
            string di = "10";//lunes.Day.ToString();
            string df = "14";//viernes.Day.ToString();
            string m = "07";//lunes.Month.ToString();
            string a = "2023";//lunes.Year.ToString();
            Service1Client client = new Service1Client();
            IList<Horario> listaHorarios = client.Horarios(a,di,df,m,esp);
            foreach (var horario in listaHorarios)
            {
                AsignarTextoACelda(horario.Hora+":"+horario.Minutos, horario.Dia, horario.Medico); // Puedes modificar el "Texto a colocar" según tus necesidades
            }

        }
        protected void BorrarCeldas()
        {
            for (int i = 1; i < TableHorario.Rows.Count; i++)
            {
                for (int j = 1; j < TableHorario.Rows[i].Cells.Count; j++)
                {
                    TableHorario.Rows[i].Cells[j].Text = string.Empty;
                    TableHorario.Rows[i].Cells[j].BackColor= Color.White;
                }
            }
        }
        protected void list_especialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            BorrarCeldas();
            RecorrerTabla();
        }
    }
}