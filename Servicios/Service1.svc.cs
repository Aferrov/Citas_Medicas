using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace Servicios
{
    public class Service1 : IService1
    {
        public void Registrarse(string nombre,string apellido,string direccion,DateTime fec_nac,string usuario, string contra)
        {
            string connectionString = "Data Source=(localdb)\\ProjectModels;Initial Catalog=CitasMedicas;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("INSERT INTO Usuario VALUES (@Valor1, @Valor2,@Valor3,@Valor4,@Valor5,@Valor6)", connection);
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
            return true;
        }
    }
}
