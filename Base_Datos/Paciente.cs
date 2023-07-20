using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Base_Datos
{
    public class Paciente
    {
        public int Registrarse(string nombre, string apellido, string direccion, DateTime fec_nac,
                                string correo,string usuario, string contra)
        {
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            int id = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
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
            }
            return id;

        }
        public Paciente Datos_Paciente(int id)
        {
            Paciente paciente_ = new Paciente();
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Select_Paciente", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    paciente_.Nombre = reader["Nombre"].ToString();
                    paciente_.Apellido = reader["Apellido"].ToString();
                    paciente_.Direccion = reader["Direccion"].ToString();
                    paciente_.Fec_Nac = (DateTime)reader["Fecha_nacimiento"];
                    paciente_.Correo = reader["Correo"].ToString();
                    paciente_.CUI = Convert.ToInt32(reader["CUI"]);
                    paciente_.VacunasCovid = Convert.ToInt32(reader["Vacunas_Covid"]);
                    paciente_.GrupoSanguineo = reader["Grupo_Sanguineo"].ToString();
                    paciente_.Carrera = reader["Carrera"].ToString();
                    
                }
                connection.Close();
            }
            return paciente_;

        }

        public List<Cita> Paciente_Citas(int id)
        {
            List<Cita> citas = new List<Cita>();
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Select_Paciente_Citas", connection);
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

        public void Actualizar_Datos(int id,string nombre, string apellido, string direccion, DateTime fec_nac,
                                string correo, string usuario,int cui, int vac, string sangre, string carrera)
        {
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Update_Paciente", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                command.Parameters.AddWithValue("@Nombre", nombre);
                command.Parameters.AddWithValue("@Apellido", apellido);
                command.Parameters.AddWithValue("@Direccion", direccion);
                command.Parameters.AddWithValue("@Fec_Nac", fec_nac);
                command.Parameters.AddWithValue("@Correo", correo);
                command.Parameters.AddWithValue("@Usuario", usuario);
                command.Parameters.AddWithValue("@CUI", cui);
                command.Parameters.AddWithValue("@Nro_Vac", vac);
                command.Parameters.AddWithValue("@Sangre", sangre);
                command.Parameters.AddWithValue("@Carrera", carrera);

                command.ExecuteNonQuery();

                connection.Close();
            }

        }

        public int PacienteId { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Direccion { get; set; }
        public DateTime Fec_Nac { get; set; }
        public string Correo { get; set; }
        public string Usuario { get; set; }
        public string Contrasena { get; set; }
        public int CUI { get; set; }
        public int VacunasCovid { get; set; }
        public string GrupoSanguineo { get; set; }
        public string Carrera { get; set; }

    }
}
