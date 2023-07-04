using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Citas_Medicas
{
    public partial class Login : System.Web.UI.Page
    {
        public bool Loguearse(string usuario, string contra)
        {
            string connectionString = "Data Source=(localdb)\\ProjectModels;Initial Catalog=CitasMedicas;Integrated Security=True";
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
            else if(contras==contra)
                return true;
            else 
                return false;  

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string u = usuario.Text;
            string c = contrasena.Text;
            bool correcto=Loguearse(u, c);
            if (correcto) 
            {
                Response.Redirect("Inicio.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Usuario o contraseña incorrectos');", true);
            }
        }
    }
}