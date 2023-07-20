using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Base_Datos
{
    public class Doctor
    {
        public int Registrarse(string nombre, string apellido, string direccion, DateTime fec_nac,
                                string correo, string usuario, string contra)
        {
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            int id = 0;

            /*using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Insert_Paciente", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Nombre", nombre);
                command.Parameters.AddWithValue("@Apellido", apellido);
                command.Parameters.AddWithValue("@Direccion", direccion);
                command.Parameters.AddWithValue("@Fec_Nac", fec_nac);
                command.Parameters.AddWithValue("@Correo", correo);
                command.Parameters.AddWithValue("@Usuario", usuario);
                command.Parameters.AddWithValue("@Contrasena", contra);

                SqlParameter parametroSalida = new SqlParameter("@Nuevo_Id", SqlDbType.Int);
                parametroSalida.Direction = ParameterDirection.Output;
                command.Parameters.Add(parametroSalida);

                command.ExecuteNonQuery();

                id = Convert.ToInt32(command.Parameters["@Nuevo_Id"].Value);


                connection.Close();
            }*/
            return id;

        }
        public Doctor Datos_Doctor(int id)
        {
            Doctor datos = new Doctor();
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Select_Medico", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    datos.Nombre = reader["Nombre"].ToString();
                    datos.Apellido = reader["Apellido"].ToString();
                    datos.Direccion = reader["Direccion"].ToString();
                    if(reader["Fecha_nacimiento"] == DBNull.Value)
                    {
                        datos.FechaNacimiento = DateTime.Parse("1900-01-01");
                    }
                    else
                    {
                        datos.FechaNacimiento = (DateTime)reader["Fecha_nacimiento"];
                    
                    }
                    datos.Correo = reader["Correo"].ToString();
                    datos.Especialidad = reader["Especialidad"].ToString();
                }
                connection.Close();
            }
            return datos;

        }

        public void Actualizar_Datos(int id, string nombre, string apellido, string direccion, DateTime fec_nac,
                                string correo, string usuario, int especialidad)
        {
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Update_Medico", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                command.Parameters.AddWithValue("@Nombre", nombre);
                command.Parameters.AddWithValue("@Apellido", apellido);
                command.Parameters.AddWithValue("@Direccion", direccion);
                command.Parameters.AddWithValue("@Fec_Nac", fec_nac);
                command.Parameters.AddWithValue("@Correo", correo);
                command.Parameters.AddWithValue("@Usuario", usuario);
                command.Parameters.AddWithValue("@Especialidad", especialidad);

                command.ExecuteNonQuery();

                connection.Close();
            }

        }

        public List<Cita> Medico_Citas(int id)
        {
            List<Cita> citas = new List<Cita>();
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Select_Medico_Citas", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Cita cita_ = new Cita();
                    cita_.Id = Convert.ToInt32(reader["Id"]);
                    cita_.PacienteId = Convert.ToInt32(reader["PacienteId"]);
                    cita_.Paciente = reader["Paciente"].ToString();
                    cita_.Fecha = reader["Fecha"].ToString();
                    cita_.Diagnostico = reader["Diagnostico"].ToString();
                    citas.Add(cita_);
                }
                connection.Close();
            }
            return citas;

        }

        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Direccion { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Correo { get; set; }
        public string Especialidad { get; set; }
    }
}
