using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Base_Datos
{
    class DBConeccion
    {
        public void registrar()
        {
            string connectionString = "Data Source=(localdb)\\ProjectModels;Initial Catalog=CitasMedicas;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT * FROM Usuario", connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    
                }
            }
        }
    }
}
