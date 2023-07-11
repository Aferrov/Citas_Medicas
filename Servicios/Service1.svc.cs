using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Base_Datos;

namespace Servicios
{
    public class Service1 : IService1
    {
        public void Registrarse(string nombre,string apellido,string direccion,DateTime fec_nac,string usuario, string contra)
        {
            BD reg = new BD();
            reg.Registrarse(nombre,apellido,direccion,fec_nac,usuario,contra);
        }
        public bool Loguearse(string usuario, string contra)
        {
            BD log = new BD();
            bool correcto = log.Loguearse(usuario,contra);
            return correcto;
        }
    }
}
