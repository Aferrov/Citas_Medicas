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
                                string correo, int cui, int vac, string sangre, string carrera)
        {
            Paciente pac= new Paciente();
            pac.Actualizar_Datos(id,nombre,apellido, direccion,fec_nac,correo, cui, vac,sangre,carrera);
        }
        
        public Paciente Datos_Paciente(int id)
        {
            Paciente pac = new Paciente();
            return pac.Datos_Paciente(id);
        }
        
        public void Actualizar_Medico(int id, string nombre, string apellido, string direccion, DateTime fec_nac,
                                string correo, int especialidad)
        {
            Doctor doc = new Doctor();
            doc.Actualizar_Datos(id, nombre, apellido, direccion, fec_nac, correo, especialidad);
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

        public List<Cita> Citas_Medico(int id, string d, string m, string a)
        {
            Doctor doc = new Doctor();
            return doc.Medico_Citas(id,d,m,a);
        }

        public List<Cita> Citas_Paciente(int id, string d, string m, string a)
        {
            Paciente pac = new Paciente();
            return pac.Paciente_Citas(id,d,m,a);
        }

        public void Cambiar_Contraseña(int id, string contra)
        {
            Usuario usu=new Usuario();
            usu.Cambiar_Contraseña(id, contra);
        }

        public List<Horario> Horarios(string anio, string diainicio, string diafin, string mes, int esp)
        {
            Horario horario = new Horario();
            return horario.Horarios_Ocupados(anio,diainicio,diafin,mes,esp);
        }

        public int Usario_Registrado(string nom, string ape, string usu)
        {
            Usuario usuario = new Usuario();
            return usuario.Usuario_Registrado(nom,ape,usu);
        }
        public List<Doctor> Medicos_Especialidad(int especialidad)
        {
            Doctor doctor = new Doctor();
            return doctor.Doctores_Especialidad(especialidad);
        }

        public void Nueva_Cita(string anio, string mes, string dia, string hora, string minutos, int medico, int paciente)
        {
            Cita cita= new Cita();
            cita.Nueva_Cita(anio,mes,dia,hora,minutos,medico,paciente);
        }
        public void Update_Cita(int id, bool estado, string diagnostico)
        {
            Cita cita = new Cita();
            cita.Update_Cita(id, estado, diagnostico);
        }
        public List<String> Meses()
        {
            Reporte reporte= new Reporte();
            return reporte.Meses();
        }
        public List<Reporte> Cantidad_Citas(int id, string mes)
        {
            Reporte reporte = new Reporte();
            return reporte.Cantidad_Reportes(id,mes);
        }
        public string Correo_Usuario(int id)
        {
            Usuario usu = new Usuario();
            return usu.Correo(id);
        }
    }
}
