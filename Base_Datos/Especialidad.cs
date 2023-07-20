using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Base_Datos
{
    public class Especialidad
    {
        public List<Especialidad> Especialidades()
        {
            List<Especialidad> especialidades = new List<Especialidad>();
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Select_Especialidad", connection);
                command.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Especialidad esp_ = new Especialidad();
                    esp_.Id = Convert.ToInt32(reader["Id"]);
                    esp_.NEspecialidad = reader["Especialidad"].ToString();
                    especialidades.Add(esp_);
                }
                connection.Close();
            }
            return especialidades;

        }

        public int Id { get; set; }
        public string NEspecialidad { get; set; }
    }
}
