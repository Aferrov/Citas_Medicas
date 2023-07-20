using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Base_Datos
{
    public class Cita
    {
        public int Id { get; set; }
        public int PacienteId { get; set; }
        public int MedicoId { get; set; }
        public string Especialidad { get; set; }
        public string Paciente { get; set; }
        public string Fecha { get; set; }
        public float Duracion { get; set; }
        public bool Estado { get; set; }
        public string Diagnostico { get; set; }
        
    }
}
