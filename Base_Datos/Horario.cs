using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Base_Datos
{
    public class Horario
    {
        public List<Horario> Horarios_Ocupados(string anio,string diainicio, string diafin, string mes, int esp)
        {
            List<Horario> horario = new List<Horario>();
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Select_Horario_Semana", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Anio", anio);
                command.Parameters.AddWithValue("@DiaInicio", diainicio);
                command.Parameters.AddWithValue("@DiaFin", diafin);
                command.Parameters.AddWithValue("@Mes", mes);
                command.Parameters.AddWithValue("@Especialidad", esp);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Horario hor = new Horario();
                    hor.Medico = reader["Medico"].ToString();
                    hor.Hora = reader["Hora"].ToString();
                    hor.Minutos = reader["Minutos"].ToString();
                    hor.Dia = reader["Dia"].ToString();
                    horario.Add(hor);
                }
                connection.Close();
            }
            return horario;

        }
        public string Dia { get; set; }
        public string Mes { get; set; }
        public string Anio { get; set; }
        public string Hora { get; set; }
        public string Minutos { get; set; }
        public string Medico { get; set; }
    }
    
}
