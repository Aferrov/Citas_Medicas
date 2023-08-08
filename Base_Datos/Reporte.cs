using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Base_Datos
{
    public class Reporte
    {
        public List<String> Meses()
        {
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            List<String> list = new List<String>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Select_Mes", connection);
                command.CommandType = CommandType.StoredProcedure;

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    String mes = reader["mes"].ToString();
                    list.Add(mes);
                }

                connection.Close();
            }
            return list;
        }

        public List<Reporte> Cantidad_Reportes(int MedicoId, string mes)
        {
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            List<Reporte> list = new List<Reporte>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Count_Citas", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@MedicoId", MedicoId);
                command.Parameters.AddWithValue("@Mes", mes);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Reporte r = new Reporte();
                    r.Fecha = reader["Fecha"].ToString();
                    r.Cantidad = Convert.ToInt32(reader["CantidadCitas"]);
                    list.Add(r);
                }

                connection.Close();
            }
            return list;
        }

        public string Fecha  { get; set; }
        public int Cantidad { get; set; }
    }
}
