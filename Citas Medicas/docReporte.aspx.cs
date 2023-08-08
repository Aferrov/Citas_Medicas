using Base_Datos;
using Citas_Medicas.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Citas_Medicas
{
    public partial class WebForm24 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadSession();
                Llenar_Meses();
                
            }
            llenarDatos();
            
        }

        private void llenarDatos()
        {
            int id = (int)(Session["Id"]);
            string mes = Meses2(list_Mes.SelectedValue);
            Service1Client client = new Service1Client();
            IList<Reporte> report = client.Cantidad_Citas(id,mes);
            int[] datosVector = new int[report.Count];
            int c = 0;
            foreach(var r in report)
            {
                datosVector[c] = r.Cantidad;
                c = c + 1;
            }

            string datosJson = new JavaScriptSerializer().Serialize(datosVector);

            ClientScript.RegisterStartupScript(this.GetType(), "datosScript", $"var datos = {datosJson};", true);
        }
        private string Meses(string mes)
        {
            string m="";
            switch(mes)
            {
                case "01":
                    m = "Enero";
                    break;
                case "02":
                    m = "Febrero";
                    break;
                case "03":
                    m = "Marzo";
                    break;
                case "04":
                    m = "Abril";
                    break;
                case "05":
                    m = "Mayo";
                    break;
                case "06":
                    m = "Junio";
                    break;
                case "07":
                    m = "Julio";
                    break;
                case "08":
                    m = "Agosto";
                    break;
                case "09":
                    m = "Setiembre";
                    break;
                case "10":
                    m = "Octubre";
                    break;
                case "11":
                    m = "Noviembre";
                    break;
                case "12":
                    m = "Diciembre";
                    break;
            }
            return m;
        }

        private string Meses2(string mes)
        {
            string m = "";
            switch (mes)
            {
                case "Enero":
                    m = "01";
                    break;
                case "Febrero":
                    m = "02";
                    break;
                case "Marzo":
                    m = "03";
                    break;
                case "Abril":
                    m = "04";
                    break;
                case "Mayo":
                    m = "05";
                    break;
                case "Junio":
                    m = "06";
                    break;
                case "Julio":
                    m = "07";
                    break;
                case "Agosto":
                    m = "08";
                    break;
                case "Setiembre":
                    m = "09";
                    break;
                case "Octubre":
                    m = "10";
                    break;
                case "Noviembre":
                    m = "10";
                    break;
                case "Diciembre":
                    m = "12";
                    break;
            }
            return m;
        }
        private void Llenar_Meses()
        {
            Service1Client client = new Service1Client();
            IList<String> meses = client.Meses();
            IList<String> nombremeses=new List<String>();
            foreach(var mes in meses)
            {
                string m = Meses(mes);
                nombremeses.Add(m);
            }
            list_Mes.DataSource = nombremeses;
            list_Mes.DataBind();
        }
        private void loadSession()
        {
            String usuario = (String)(Session["Usuario"]);
            int id = (int)(Session["Id"]);
            Service1Client client = new Service1Client();
            Doctor doc = client.Datos_Medico(id);
            Cookie.Text = usuario;
            LabelNombre.Text = doc.Nombre + " " + doc.Apellido;
            LabelCorreo.Text = doc.Correo;
        }

        
    }
}