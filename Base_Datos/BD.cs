using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Base_Datos
{
    public class BD
    {
        public static void Main(string[] args)
        {
            Console.ReadKey();
        }
        public void Registrarse(string nombre, string apellido, string direccion, DateTime fec_nac,
                                string usuario, string contra)
        {
            string connectionString = "Data Source=(localdb)\\ProjectModels;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("INSERT INTO Usuario " +
                    "VALUES (@Valor1, @Valor2,@Valor3,@Valor4,@Valor5,@Valor6)", connection);
                command.Parameters.AddWithValue("@Valor1", nombre);
                command.Parameters.AddWithValue("@Valor2", apellido);
                command.Parameters.AddWithValue("@Valor3", direccion);
                command.Parameters.AddWithValue("@Valor4", fec_nac);
                command.Parameters.AddWithValue("@Valor5", usuario);
                command.Parameters.AddWithValue("@Valor6", contra);

                command.ExecuteNonQuery();
                connection.Close();
            }

        }
        public bool Loguearse(string usuario, string contra)
        {
            string connectionString = "Data Source=(localdb)\\ProjectModels;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            string contras = "";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT contrasena FROM Usuario WHERE usuario=@Value1", connection);
                command.Parameters.AddWithValue("@Value1", usuario);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    contras = reader["Contrasena"].ToString();
                }
                connection.Close();
            }
            if (contras == "")
                return false;
            else if (contras == contra)
                return true;
            else
                return false;

        }
    }
}
