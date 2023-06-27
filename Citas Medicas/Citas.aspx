<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Citas.aspx.cs" Inherits="Citas_Medicas.Citas" %>

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

    <title>Citas</title>
    <style>
        .popup {
            animation: transitionIn-Y-bottom 0.5s;
        }

        .sub-table {
            animation: transitionIn-Y-bottom 0.5s;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="menu">
            <table class="menu-container" border="0">
                <tbody><tr>
                    <td style="padding:10px" colspan="2">
                        <table border="0" class="profile-container">
                            <tbody><tr>
                                <td width="30%" style="padding-left:20px">
                                    <img src="../img/logo_azul.png" alt="" width="100%" style="border-radius:50%">
                                </td>
                                <td style="padding:0px;margin:0px;">
                                    <p class="profile-title">Nombre..</p>
                                    <p class="profile-subtitle">nombre@unsa.edu.pe</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="../logout.php"><input type="button" value="Cerrar Sesión" class="logout-btn btn-primary-soft btn"></a>
                                </td>
                            </tr>
                        </tbody></table>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-home menu-active menu-icon-home-active">
                        <a href="index.php" class="non-style-link-menu non-style-link-menu-active">
                            </a><div><a href="Inicio.aspx" class="non-style-link-menu non-style-link-menu-active">
                                <p class="menu-text">Inicio</p>
                        </a>
        </div>
        </td>
    </tr>
    <tr class="menu-row">
        <td class="menu-btn menu-icon-session">
            <a href="Citas.aspx" class="non-style-link-menu">
                <div>
                    <p class="menu-text">Citas</p>
                </div>
            </a>
        </td>
    </tr>
    <tr class="menu-row">
        <td class="menu-btn menu-icon-appoinment">
            <a href="appointment.php" class="non-style-link-menu">
                </a><div><a href="appointment.php" class="non-style-link-menu">
                    <p class="menu-text">Mi Historial</p>
            </a></div>
        </td>
    </tr>
    <tr class="menu-row">
        <td class="menu-btn menu-icon-settings">
            <a href="settings.php" class="non-style-link-menu">
                </a><div><a href="settings.php" class="non-style-link-menu">
                    <p class="menu-text">Configuración</p>
            </a></div>
        </td>
    </tr>

    </tbody></table>
    </div>
    <div class="dash-body">
        <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;margin-top:25px; ">
            <tr>
                <td width="13%">
                    <a href="Inicio.aspx"><button class="login-btn btn-primary-soft btn btn-icon-back" style="padding-top:11px;padding-bottom:11px;margin-left:20px;width:125px">
                            <font class="tn-in-text">Volver</font>
                        </button></a>
                </td>
                <td>
                    <form action="" method="post" class="header-search">

                        <input type="search" name="search" class="input-text header-searchbar" placeholder="Búsqueda por Nombre, Doctor o Correo or Date (YYYY-MM-DD)" list="doctors" value="">&nbsp;&nbsp;

                        <datalist id="doctors"><option value='Barry Hernandez Correa'><br/><option value='Steve Yurato Carrillo'><br/><option value='Samuel Torres Mantilla'><br/><option value='goku'><br/><option value='Juan Gutierrez Chavez'><br/><option value='Daniel Villa Duran'><br/><option value='Javier Warry Guzman'><br/><option value='Luisa Rojas Valverde'><br/><option value='Raul Fernandez Dominguez'><br/><option value='Virgilio'><br/><option value='Dario Terrifo Casas'><br/><option value='Leonardo Flores Bazan'><br/><option value='julissa hernandez'><br/><option value='edgar'><br/><option value='Román Beteta'><br/><option value='1'><br/><option value='12'><br/><option value='1234abcd'><br/><option value='212312'><br/><option value='abc'><br/><option value='Alergologia'><br/><option value='Análisis radiológico   '><br/><option value='Anesteciología'><br/><option value='asasas'><br/><option value='atencion'><br/><option value='aws'><br/><option value='Cardiologia'><br/><option value='Cirugía dental, ora '><br/><option value='Cirugia General'><br/><option value='CIRUGIA GENERAL 30/05/2023'><br/><option value='Cita de prueba'><br/><option value='Consulta'><br/><option value='dermatologia'><br/><option value='Endocrinologia'><br/><option value='ewrwerew'><br/><option value='Gastroenterología'><br/><option value='Geriatria'><br/><option value='gfdfgfg'><br/><option value='Girugia General'><br/><option value='Hematología General '><br/><option value='Hummm'><br/><option value='Immunología '><br/><option value='Lavado'><br/><option value='Lunes'><br/><option value='Martes 21 Dr Mateo'><br/><option value='medicina de urgencia'><br/><option value='Medicina General'><br/><option value='Motilada'><br/><option value='Neumatico'><br/><option value='nicolas'><br/><option value='odontologo'><br/><option value='ok'><br/><option value='Ondodoncia'><br/><option value='pepepep'><br/><option value='Primera CITA'><br/><option value='PROGRAMACION CX '><br/><option value='pruba24'><br/><option value='PruebaJairo'><br/><option value='PruebaJAiro2'><br/><option value='PruebaSesión'><br/><option value='PruebaT'><br/><option value='Salud renal'><br/><option value='sesion 24'><br/><option value='Terapia muscular en pierna'><br/><option value='Testeando'><br/><option value='xd'><br/> </datalist>

                        <input type="Submit" value="Búsqueda" class="login-btn btn-primary btn" style="padding-left: 25px;padding-right: 25px;padding-top: 10px;padding-bottom: 10px;">

                    </form>
                </td>
                <td width="15%">
                    <p style="font-size: 14px;color: rgb(119, 119, 119);padding: 0;margin: 0;text-align: right;">
                        Fecha
                    </p>
                    <p class="heading-sub12" style="padding: 0;margin: 0;">
                        2023-06-27                    </p>
                </td>
                <td width="10%">
                    <button class="btn-label" style="display: flex;justify-content: center;align-items: center;"><img src="../img/calendar.svg" width="100%"></button>
                </td>


            </tr>

            <tr>
                <td colspan="4" style="padding-top:10px;width: 100%;">
                    <a class="non-style-link" href="schedule.php"><button  class="login-btn btn-primary-soft btn"  style="display: flex;justify-content: center;align-items: center;margin-left:20px;">&nbsp; Nueva Cita &nbsp;</font></button>
                    </a>
                </td>

            </tr>
            <tr>
                <td colspan="4" style="padding-top:10px;width: 100%;">
                    <p class="heading-main12" style="margin-left: 45px;font-size:18px;color:rgb(49, 49, 49)">Cantidad  Citas(0) </p>
                    <p class="heading-main12" style="margin-left: 45px;font-size:22px;color:rgb(49, 49, 49)"> </p>
                </td>

            </tr>



            <tr>
                <td colspan="4">
                    <center>
                        <div class="abc scroll">
                            <table width="100%" class="sub-table scrolldown" border="0" style="padding: 50px;border:none">

                                <tbody>

                                    <tr>
                                    <td colspan="4">
                                    <br><br><br><br>
                                    <center>
                                    <img src="../img/notfound.svg" width="25%">
                                    
                                    <br>
                                    <p class="heading-main12" style="margin-left: 45px;font-size:20px;color:rgb(49, 49, 49)">We  couldnt find anything related to your keywords !</p>
                                    <a class="non-style-link" href="schedule.php"><button  class="login-btn btn-primary-soft btn"  style="display: flex;justify-content: center;align-items: center;margin-left:20px;">&nbsp; Mostrar todas las sesiones &nbsp;</font></button>
                                    </a>
                                    </center>
                                    <br><br><br><br>
                                    </td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </center>
                </td>
            </tr>



        </table>
    </div>
    </div>

    </div>

</body>

</html>
