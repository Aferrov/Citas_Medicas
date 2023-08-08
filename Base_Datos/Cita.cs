using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Base_Datos
{
    public class Cita
    {
        public void Nueva_Cita(string anio, string mes, string dia, string hora, string minutos, int medico, int paciente)
        {
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            int id = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Insert_Cita", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Anio", anio);
                command.Parameters.AddWithValue("@Mes", mes);
                command.Parameters.AddWithValue("@Dia", dia);
                command.Parameters.AddWithValue("@Hora", hora);
                command.Parameters.AddWithValue("@Minutos", minutos);
                command.Parameters.AddWithValue("@Medico", medico);
                command.Parameters.AddWithValue("@Paciente", paciente);

                command.ExecuteNonQuery();

                connection.Close();
            }

        }

        public void Update_Cita(int id, bool estado, string diagnostico)
        {
            List<Cita> citas = new List<Cita>();
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Update_Cita", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                if (estado==false)
                {
                    command.Parameters.AddWithValue("@Estado", estado);
                }
                if (!string.IsNullOrEmpty(diagnostico))
                {
                    command.Parameters.AddWithValue("@Diagnostico", diagnostico);
                }

                command.ExecuteNonQuery();

                connection.Close();
            }

        }

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
