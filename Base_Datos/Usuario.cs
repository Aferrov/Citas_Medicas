﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Base_Datos
{
    public class Usuario
    {
        public static void Main(string[] args)
        {
            IList<Cita> citas = new Doctor().Medico_Citas(4);
            foreach (Cita c in citas)
            {
                Console.WriteLine(c.Paciente);
            }
            /*Doctor d = new Doctor().Datos_Doctor(4);
            Console.WriteLine(d.Nombre);*/
            Console.ReadKey();
        }

        public bool Loguearse(string usuario, string contra)
        {
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            string contras = "";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Login_Usuario", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Usuario", usuario);
                SqlParameter parametroSalida = new SqlParameter("@Contrasena", SqlDbType.NVarChar,15);
                parametroSalida.Direction = ParameterDirection.Output;
                command.Parameters.Add(parametroSalida);

                command.ExecuteNonQuery();

                contras = command.Parameters["@Contrasena"].Value.ToString();
                connection.Close();
            }
            if (contras == "")
                return false;
            else if (contras == contra)
                return true;
            else
                return false;

        }

        public void Cambiar_Contraseña(int id, string contra)
        {
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Update_Contrasena", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);
                command.Parameters.AddWithValue("@Contrasena", contra);
              
                command.ExecuteNonQuery();
                connection.Close();
            }
            

        }
        public int Rol_Usuario(int id)
        {
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            int rol = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Select_Rol_Usuario", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Id", id);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    rol = Convert.ToInt32(reader["RolId"]);
                }
                connection.Close();
            }
            return rol;

        }

        public int Id_Usuario(string usuario)
        {
            string connectionString = "Data Source=ARLEEN;" +
                "Initial Catalog=CitasMedicas;Integrated Security=True";
            int id = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("Select_Id_Usuario", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Usuario", usuario);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    id = Convert.ToInt32(reader["Id"]);
                }
                connection.Close();
            }
            return id;

        }
    }
}