using System;
using System.Collections.Generic;
using System.Data;
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
        public int Registrarse(string nombre,string apellido,string direccion,DateTime fec_nac,string correo,string usuario, string contra)
        {
            Paciente reg = new Paciente();
            return reg.Registrarse(nombre,apellido,direccion,fec_nac,correo,usuario,contra);
        }
        public bool Loguearse(string usuario, string contra)
        {
            Usuario log = new Usuario();
            bool correcto = log.Loguearse(usuario,contra);
            return correcto;
        }

        public int Rol_Usuario(int id)
        {
            Usuario usu = new Usuario();
            return usu.Rol_Usuario(id);
        }

        public void Actualizar_Paciente(int id, string nombre, string apellido, string direccion, DateTime fec_nac,
                                string correo, string usuario, int cui, int vac, string sangre, string carrera)
        {
            Paciente pac= new Paciente();
            pac.Actualizar_Datos(id,nombre,apellido, direccion,fec_nac,correo, usuario, cui, vac,sangre,carrera);
        }
        
        public Paciente Datos_Paciente(int id)
        {
            Paciente pac = new Paciente();
            return pac.Datos_Paciente(id);
        }
        
        public void Actualizar_Medico(int id, string nombre, string apellido, string direccion, DateTime fec_nac,
                                string correo, string usuario, int especialidad)
        {
            Doctor doc = new Doctor();
            doc.Actualizar_Datos(id, nombre, apellido, direccion, fec_nac, correo, usuario, especialidad);
        }

        public Doctor Datos_Medico(int id)
        {
            Doctor doc = new Doctor();
            return doc.Datos_Doctor(id);
        }

        public List<Especialidad> Especialidades()
        {
            Especialidad esp= new Especialidad();
            return esp.Especialidades();
        }

        public int Id_Usuario(string usuario)
        {
            Usuario usu = new Usuario();
            return usu.Id_Usuario(usuario);
        }

        public List<Cita> Citas_Medico(int id)
        {
            Doctor doc = new Doctor();
            return doc.Medico_Citas(id);
        }

        public List<Cita> Citas_Paciente(int id)
        {
            Paciente pac = new Paciente();
            return pac.Paciente_Citas(id);
        }
    }
}
