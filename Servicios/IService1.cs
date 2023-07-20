using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Base_Datos;

namespace Servicios
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        int Registrarse(string nombre, string apellido, string direccion, DateTime fec_nac,string correo, string usuario, string contra);

        [OperationContract]
        bool Loguearse(string usuario, string contra);

        [OperationContract]
        int Rol_Usuario(int id);

        [OperationContract]
        void Actualizar_Paciente(int id, string nombre, string apellido, string direccion, DateTime fec_nac,
                                string correo, string usuario, int cui, int vac, string sangre, string carrera);

        [OperationContract]
        Paciente  Datos_Paciente(int id);

        [OperationContract]
        void Actualizar_Medico(int id, string nombre, string apellido, string direccion, DateTime fec_nac,
                                string correo, string usuario, int especialidad);

        [OperationContract]
        Doctor Datos_Medico(int id);

        [OperationContract]
        List<Especialidad> Especialidades();

        [OperationContract]
        int Id_Usuario(string usuario);

        [OperationContract]
        List<Cita> Citas_Medico(int id);

        [OperationContract]
        List<Cita> Citas_Paciente(int id);

    }
}
