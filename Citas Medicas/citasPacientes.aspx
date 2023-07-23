<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="citasPacientes.aspx.cs" Inherits="Citas_Medicas.WebForm4" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/animations.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="icon" type="image/png" sizes="16x16" href="../img/logo.png">

    <title>Nueva Cita</title>
    
</head>

<body>
    <div class="container">
        <div class="menu">
            <table class="menu-container" border="0">
                <tr>
                    <td style="padding:10px" colspan="2">
                        <table border="0" class="profile-container">
                            <tr>
                                <td width="30%" style="padding-left:20px">
                                    <img src="../img/logo_azul.png" alt="" width="100%" style="border-radius:50%">
                                </td>
                                <td style="padding:0px;margin:0px;">
                                    <asp:Label ID="LabelNombre" runat="server" Text="Nombre"></asp:Label>
                                    <asp:Label ID="LabelCorreo" runat="server" Text="Correo"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="Pagina_Inicio.aspx"><input type="button" value="Cerrar Sesión" class="logout-btn btn-primary-soft btn"></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-inicio">
                        <a href="inicioPaciente.aspx" class="non-style-link-menu">
                            <div>
                                <a href="inicioPaciente.aspx" class="non-style-link-menu">
                                    <p class="menu-text">Inicio</p>
                                </a>
                            </div>
                        </a>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-home menu-active menu-icon-home-active">
                        <a href="citasPacientes.aspx" class="non-style-link-menu non-style-link-menu-active">
                            <div>
                                <p class="menu-text">Citas</p>
                            </div>
                        </a>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-historial">
                        <a href="historial.aspx" class="non-style-link-menu">
                            <div>
                                <p class="menu-text">Mi Historial</p>
                            </div>
                        </a>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-configPacientes">
                        <a href="configPaciente.aspx" class="non-style-link-menu">
                            <div>
                                <p class="menu-text">Configuración</p>
                            </div>
                        </a>
                    </td>
                </tr>
            </table>
        </div>

        <div class="dash-body">
            <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;margin-top:25px; ">
                <tr>
                    <td width="13%">
                        <a href="inicioPacientes.aspx"><button class="login-btn btn-primary-soft btn btn-icon-back" style="padding-top:11px;padding-bottom:11px;margin-left:20px;width:125px">
                            <font class="tn-in-text">Volver</font>
                        </button></a>
                    </td>
                    <td>
                        <form action="" method="post" class="header-search">
                            <input type="search" name="search" class="input-text header-searchbar" placeholder="Buscar nombre del doctor o correo electrónico" list="doctors">&nbsp;&nbsp;
                            <datalist id="doctors">
                                <!-- Options for doctors list -->
                            </datalist>
                            <input type="Submit" value="Búsqueda" class="login-btn btn-primary btn" style="padding-left: 25px;padding-right: 25px;padding-top: 10px;padding-bottom: 10px;">
                        </form>
                    </td>
                    <td width="15%">
                        <p style="font-size: 14px;color: rgb(119, 119, 119);padding: 0;margin: 0;text-align: right;">
                            Fecha
                        </p>
                        <asp:Label ID="Fecha_Actual" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td width="10%">
                        <button class="btn-label" style="display: flex;justify-content: center;align-items: center;"><img src="../img/calendar.svg" width="100%"></button>
                    </td>
                </tr>
                <tr>
          <td colspan="3">
            <div style="text-align: center; margin-top: 20px;">
              <select id="specialty-select">
                <option value="Cardiología">Cardiología</option>
                <option value="Dermatología">Dermatología</option>
                <option value="Gastroenterología">Gastroenterología</option>
                <option value="Pediatría">Pediatría</option>
                <option value="Neurología">Neurología</option>
              </select>
              <button onclick="showSchedule()">Buscar</button>
            </div>
          </td>
        </tr>
                <tr>
                    <td colspan="3">
            <center>
              <div class="abc scroll">
                <div class="schedule-container">
                  <p class="schedule-heading">Horario:</p>
                  <table class="schedule-table">
                    <thead>
                      <tr>
                        <th></th>
                        <th>Lunes</th>
                        <th>Martes</th>
                        <th>Miércoles</th>
                        <th>Jueves</th>
                        <th>Viernes</th>
                      </tr>
                    </thead>
                    <tbody id="schedule-body">
                      <!-- Aquí se generará el horario -->
                    </tbody>
                  </table>
                </div>
              </div>
            </center>
          </td>
        </tr>
        
      </table>
    </div>
  </div>

   <script>
       // Función para mostrar el horario correspondiente a la especialidad seleccionada
       function showSchedule() {
           var specialtySelect = document.getElementById("specialty-select");
           var selectedSpecialty = specialtySelect.value;
           var scheduleBody = document.getElementById("schedule-body");
           scheduleBody.innerHTML = "";

           // Obtener los doctores y horas correspondientes a la especialidad seleccionada
           var doctors = getDoctorsBySpecialty(selectedSpecialty);

           // Generar el horario
           var hours = ["8:00 am", "8:15 am", "8:30 am", "8:45 am", "9:00 am", "9:15 am", "9:30 am", "9:45 am", "10:00 am", "10:15 am", "10:30 am", "10:45 am", "11:00 am", "11:15 am", "11:30 am", "11:45 am", "12:00 pm", "12:15 pm", "12:30 pm", "12:45 pm", "1:00 pm", "1:15 pm", "1:30 pm", "1:45 pm", "2:00 pm"];

           var isReserved = isHourReserved(doctorIndex, j + 1, timeString);
           if (isReserved) {
               cell.classList.add("reserved-cell");
           }

           for (var i = 0; i < hours.length; i++) {
               var timeString = hours[i];

               var row = document.createElement("tr");
               var timeCell = document.createElement("td");
               timeCell.innerText = timeString;
               row.appendChild(timeCell);

               for (var j = 0; j < 5; j++) {
                   var doctorIndex = doctors.findIndex(
                       (doctor) => doctor.hours.includes(timeString) && doctor.days.includes(j + 1)
                   );

                   var cell = document.createElement("td");
                   var cellContent = "";

                   if (doctorIndex >= 0) {
                       cellContent = doctors[doctorIndex].name;
                       cell.classList.add("doctor-cell");
                   }

                   // Verificar si la hora está reservada
                   var isReserved = isHourReserved(doctorIndex, j + 1, timeString);
                   if (isReserved) {
                       cell.classList.add("reserved-cell");
                   }


                   cell.innerText = cellContent;
                   row.appendChild(cell);
               }

               scheduleBody.appendChild(row);
           }
       }

       // Función para obtener los doctores y horas correspondientes a la especialidad seleccionada
       function getDoctorsBySpecialty(specialty) {
           // Aquí puedes definir tus propios datos de doctores y especialidades
           var doctors = [
               { name: "Dr. Juan Pérez", specialty: "Cardiología", hours: ["8:00 am", "10:00 am", "11:30 am"], days: [2, 3, 4] },
               { name: "Dra. María Gómez", specialty: "Dermatología", hours: ["9:30 am", "1:00 pm"], days: [1, 3] },
               { name: "Dr. Pedro Rodríguez", specialty: "Gastroenterología", hours: ["8:00 am", "9:00 am", "11:00 am"], days: [1, 2, 5] },
               { name: "Dra. Laura García", specialty: "Pediatría", hours: ["10:30 am", "1:30 pm"], days: [1, 4] },
               { name: "Dr. Roberto Sánchez", specialty: "Neurología", hours: ["8:15 am", "10:45 am", "12:30 pm"], days: [2, 3, 5] },
               { name: "Dra. Ana López", specialty: "Neurología", hours: ["9:00 am", "11:15 am", "1:45 pm"], days: [1, 4, 5] },
               { name: "Dr. Andrés Torres", specialty: "Cardiología", hours: ["9:00 am", "11:30 am"], days: [1, 2] },
               { name: "Dra. Patricia Mendoza", specialty: "Dermatología", hours: ["8:30 am", "10:00 am", "12:45 pm"], days: [1, 3, 5] },
               { name: "Dr. Miguel Fernández", specialty: "Gastroenterología", hours: ["8:00 am", "9:45 am", "11:30 am"], days: [2, 4, 5] },
               { name: "Dra. Carolina Ramos", specialty: "Pediatría", hours: ["10:00 am", "12:00 pm", "1:30 pm"], days: [1, 2, 3] },
               { name: "Dr. Carlos Medina", specialty: "Neurología", hours: ["9:15 am", "11:45 am", "1:00 pm"], days: [3, 4, 5] },
               { name: "Dr. Juan López", specialty: "Gastroenterología", hours: ["8:30 am"], days: [1] },

           ];

           return doctors.filter(doctor => doctor.specialty === specialty);
       }

       // Función para verificar si la hora está reservada
       function isHourReserved(doctorIndex, day, time) {
           var reservedHours = [
               { doctorIndex: 0, day: 3, time: "10:00 am" },//
               { doctorIndex: 0, day: 2, time: "11:30 am" },
               { doctorIndex: 1, day: 5, time: "8:30 am" },
               { doctorIndex: 2, day: 1, time: "8:30 am" }, //
               { doctorIndex: 3, day: 1, time: "10:00 am" },
               { doctorIndex: 4, day: 5, time: "8:15 am" },
               
           ];

           var reservedHour = reservedHours.find(reservedHour => reservedHour.doctorIndex === doctorIndex && reservedHour.day === day && reservedHour.time === time);
           return reservedHour !== undefined;
       }
   </script>



                            </div>
                        </center>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>

</html>
