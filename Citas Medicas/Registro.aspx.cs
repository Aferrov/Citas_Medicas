using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Citas_Medicas.ServiceReference1;

namespace Citas_Medicas
{
    public partial class Registro : System.Web.UI.Page
    {
        public void Registrarse(string nombre, string apellido, string direccion, DateTime fec_nac, string usuario, string contra)
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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_enviar_Click(object sender, EventArgs e)
        {
            string nom=nombre.Text;
            string ape=apellido.Text;
            string dir = direccion.Text;
            DateTime fec= new DateTime(1920, 1, 1);
            if (!string.IsNullOrEmpty(fec_nac.Text))
                DateTime.Parse(fec_nac.Text);
            string usu=usuario.Text;
            string con=contrasena.Text;
            //Service1Client client = new Service1Client();
            //client.Registrarse(nom,ape,dir,fec,usu,con);
            Registrarse(nom, ape, dir, fec, usu, con);
            
        }
    }
}