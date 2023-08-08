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
        public static IList<Horario> horarios;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                horarios= new List<Horario>();
                loadSession();
                llenarListaEspecialidades();
                llenarListaHorarios();
                llenarListaDoctores();
                llenarTabla();
                RecorrerTabla();
                llenarListaDias();
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
            Cookie.Text= usuario;
            LabelNombre.Text = paciente.Nombre + " " + paciente.Apellido;
            LabelCorreo.Text = paciente.Correo;
            Fecha_Actual.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
        
        private void llenarListaEspecialidades()
        {
            Service1Client client = new Service1Client();
            IList<Especialidad> especialidades = client.Especialidades();

            list_especialidades.DataSource = especialidades;
            list_especialidades.DataTextField = "NEspecialidad";
            list_especialidades.DataValueField = "Id";
            list_especialidades.DataBind();
        }

        private void llenarListaDoctores()
        {
            int id_esp= Convert.ToInt32(list_especialidades.SelectedValue);
            Service1Client client = new Service1Client();
            IList<Doctor> doctores = client.Medicos_Especialidad(id_esp);

            list_Doctores.DataSource = doctores;
            list_Doctores.DataTextField = "NombreCompleto";
            list_Doctores.DataValueField = "Id";
            list_Doctores.DataBind();
        }

        private void llenarListaDias()
        {
            var diasSemana = new[] { "Lunes", "Martes", "Miércoles", "Jueves", "Viernes" };
            var diaActual = DateTime.Now.DayOfWeek;

            list_Dias.Items.Clear();

            int inicio=0;
            if (diaActual == DayOfWeek.Saturday || diaActual == DayOfWeek.Sunday)
            {
                inicio = 0;
            }
            else if (diaActual >= DayOfWeek.Monday && diaActual <= DayOfWeek.Friday)
            {
                inicio = (int)diaActual-1; 
            }

            for (int i = inicio; i < diasSemana.Length; i++)
            {
                list_Dias.Items.Add(new ListItem(diasSemana[i], diasSemana[i]));
            }

        }
        private void llenarListaHorarios()
        {
            DateTime horaBase = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 8, 30, 0);

            List<string> horarios = new List<string>();
            for (int k = 0; k < 22; k++)
            {
                string h = horaBase.ToString("HH:mm");
                horarios.Add(h);

                horaBase = horaBase.AddMinutes(15);
            }
            list_Horarios.DataSource = horarios;
            list_Horarios.DataBind();

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
                fila.CssClass = "texto";
                TableHorario.Rows.Add(fila);
            }
            
        }
        
        protected DateTime ObtenerFechaLunes()
        {
            DateTime hoy = DateTime.Today;
            int numeroDiaSemana = (int)hoy.DayOfWeek;
            int diasHastaLunes;

            if (numeroDiaSemana == (int)DayOfWeek.Saturday || numeroDiaSemana == (int)DayOfWeek.Sunday)
            {
                diasHastaLunes = ((int)DayOfWeek.Monday - numeroDiaSemana + 7) % 7;
            }
            else
            {
                diasHastaLunes = numeroDiaSemana - (int)DayOfWeek.Monday;
                if (diasHastaLunes < 0)
                {
                    diasHastaLunes += 7;
                }
            }

            DateTime fechaLunes = hoy.AddDays(-diasHastaLunes);
            return fechaLunes;
        }

        private void AsignarTextoACelda(string hora, string dia, string texto)
        {
            TableRow filaHora = null;
            foreach (TableRow fila in TableHorario.Rows)
            {
                string horaEnCelda = fila.Cells[0].Text;
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
            int d = -1;
            DateTime lunes = ObtenerFechaLunes();
            int diasfal = DiasFinMes();
            if (diasfal < 4)
            {
                DateTime primerDiaProximoMes = new DateTime(lunes.Year, lunes.Month, 1).AddMonths(1);

                DateTime ultimoDiaMesActual = primerDiaProximoMes.AddDays(-1);
                if (dia <= ultimoDiaMesActual.Day && dia>=lunes.Day)
                    d = (ultimoDiaMesActual.Day - lunes.Day)+1;
                else
                {
                    DateTime otromes = ultimoDiaMesActual.AddDays(4-diasfal);
                    d = 5-(otromes.Day - dia);
                }
            }
            else
                d=(dia - lunes.Day)+1;
            return d;
        }

        private int DiasFinMes()
        {
            DateTime lunes = ObtenerFechaLunes();
            DateTime primerDiaProximoMes = new DateTime(lunes.Year, lunes.Month, 1).AddMonths(1);

            DateTime ultimoDiaMesActual = primerDiaProximoMes.AddDays(-1);
            int dias = Convert.ToInt32(ultimoDiaMesActual.Day.ToString()) - Convert.ToInt32(lunes.Day.ToString());
            return dias;
        }
        protected void RecorrerTabla()
        {
            horarios.Clear();
            int esp = Convert.ToInt32(list_especialidades.SelectedValue);
            DateTime lunes = ObtenerFechaLunes();
            int diasfal = DiasFinMes();
            if(diasfal<4)
            {
                DateTime FinMes = lunes.AddDays(diasfal);
                string di = lunes.ToString("dd");
                string df = FinMes.ToString("dd");
                string m = lunes.ToString("MM");
                string a = lunes.Year.ToString();
                Service1Client client = new Service1Client();
                IList<Horario> listaHorarios = client.Horarios(a, di, df, m, esp);
                foreach (var horario in listaHorarios)
                {
                    horarios.Add(horario);
                    AsignarTextoACelda(horario.Hora + ":" + horario.Minutos, horario.Dia, horario.Medico);
                }
                DateTime OtroMes = FinMes.AddDays(4-diasfal);
                di = FinMes.AddDays(1).ToString("dd");
                df = OtroMes.ToString("dd");
                m = OtroMes.ToString("MM");
                a = OtroMes.Year.ToString();
                IList<Horario> listaHorarios2 = client.Horarios(a, di, df, m, esp);
                foreach (var horario1 in listaHorarios2)
                {
                    horarios.Add(horario1);
                    AsignarTextoACelda(horario1.Hora + ":" + horario1.Minutos, horario1.Dia, horario1.Medico);
                }
            }
            else 
            {
                DateTime viernes = lunes.AddDays(4);
                string di = lunes.ToString("dd");
                string df = viernes.ToString("dd");
                string m = lunes.ToString("MM");
                string a = lunes.Year.ToString();
                Service1Client client = new Service1Client();
                IList<Horario> listaHorarios = client.Horarios(a,di,df,m,esp);
                foreach (var horario in listaHorarios)
                {
                    horarios.Add(horario);
                    AsignarTextoACelda(horario.Hora+":"+horario.Minutos, horario.Dia, horario.Medico);
                }
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
            llenarListaDoctores();
        }

        private string ObtenerDia(string dia)
        {
            string dia_ = "";
            DateTime lunes = ObtenerFechaLunes();
            switch(dia)
            {
                case "Lunes":
                    {
                        dia_ = lunes.ToString("dd");
                        break;
                    }
                    
                case "Martes":
                    {
                        DateTime d = lunes.AddDays(1);
                        dia_ = d.ToString("dd");
                        break;
                    }
                case "Miércoles":
                    {
                        DateTime d2 = lunes.AddDays(2);
                        dia_ = d2.ToString("dd");
                        break;
                    }
                case "Jueves":
                    {
                        DateTime d3 = lunes.AddDays(3);
                        dia_ = d3.ToString("dd");
                        break;
                    }
                case "Viernes":
                    {
                        DateTime d4 = lunes.AddDays(4);
                        dia_ = d4.ToString("dd");
                        break;
                    }
            }
            return dia_;
        }
        private string ObtenerMes(int dia)
        {
            string mes_ = "";
            DateTime lunes = ObtenerFechaLunes();
            DateTime primerDiaProximoMes = new DateTime(lunes.Year, lunes.Month, 1).AddMonths(1);
            DateTime ultimoDiaMesActual = primerDiaProximoMes.AddDays(-1);
            if (ultimoDiaMesActual.Day - dia < 4)
                mes_ = primerDiaProximoMes.ToString("MM");
            else
                mes_ = lunes.ToString("MM");

            return mes_;
        }
        protected void BtnReservar_Click(object sender, EventArgs e)
        {
            int id = (int)(Session["Id"]);
            DateTime lunes = ObtenerFechaLunes();
            string horaCompleta = list_Horarios.SelectedValue.ToString();
            string[] partes = horaCompleta.Split(':');
            string hora = partes[0];
            string minutos = partes[1];
            string anio= lunes.Year.ToString();
            string nombredia=list_Dias.SelectedValue.ToString();
            string dia = ObtenerDia(nombredia);
            string mes=ObtenerMes(Convert.ToInt32(dia));
            
            int medico=Convert.ToInt32(list_Doctores.SelectedValue);
            
            int esp= Convert.ToInt32(list_especialidades.SelectedValue);
            bool ocupado=false;
            foreach (Horario horario in horarios)
            {
                if(horario.Hora==hora && horario.Minutos==minutos && horario.Dia==dia && horario.Mes==mes)
                {
                    ocupado=true;
                    break;
                }
                    
            }
            if(ocupado==false)
            {
                Service1Client client = new Service1Client();
                if(esp==3)
                {
                    client.Nueva_Cita(anio, mes, dia, hora, minutos, medico, id);
                    int indiceSeleccionado = list_Horarios.SelectedIndex;
                    string horacompleta2= list_Horarios.Items[indiceSeleccionado + 1].Value;
                    string[] partes2 = horacompleta2.Split(':');
                    string hora2 = partes2[0];
                    string minutos2 = partes2[1];
                    client.Nueva_Cita(anio, mes, dia, hora2, minutos2, medico, id);
                }
                else
                    client.Nueva_Cita(anio, mes, dia, hora, minutos, medico, id);
                BorrarCeldas();
                RecorrerTabla();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Horario ya ocupado');", true);
            }
            

        }
    }
}