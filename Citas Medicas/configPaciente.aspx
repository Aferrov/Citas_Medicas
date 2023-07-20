<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="configPaciente.aspx.cs" Inherits="CITAS_F.WebForm6" %>


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

    <title>Configuración</title>
    <style>
        .dashbord-tables {
            animation: transitionIn-Y-over 0.5s;
        }

        .filter-container {
            animation: transitionIn-X 0.5s;
        }

        .sub-table {
            animation: transitionIn-Y-bottom 0.5s;
        }
   
        :root {
            --primarycolor: #1984bc;
            --primarycolorhover: #094361;
            --btnice:#D8EBFA;
            --btnnicetext:#21475b;
        }

        body{
            margin: 0;
            padding: 0;
            border-spacing: 0;
            font-family: 'Inter', sans-serif;
            
        }

        *, ::after, ::before{
            box-sizing: border-box;
        }

        .container {
            display: flex;
        }

        /* -----------Buttons---------------*/
        .btn{
            cursor: pointer;
            padding: 8px 20px;
            outline: none;
            text-decoration: none;
            font-size: 15px;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            border-radius: 5px;
            font-family: 'Inter', sans-serif;
        }



        .btn-primary-soft{
            background-color: #D8EBFA ;
            color: #1969AA;
            font-weight: 100px;
            font-size: 16px;
            border: none;
        }

        .btn-primary-soft:hover{
            background-color: var(--primarycolor) ;
            color: #fff ;
            box-shadow: 0 3px 5px 0 rgba(57,108,240,0.3);
        }

        .btn-in-text{
            font-size: 15px;
            letter-spacing: 0.5px;
        }

        .non-style-link:link, .non-style-link:visited, .non-style-link:hover, .non-style-link:active{
            text-decoration: none;
            color: rgb(43, 43, 43);
        }

        .btn-label{
            margin-left: 10px;
            padding: 12px 12px;
            outline: none;
            text-decoration: none;
            font-size: 15px;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            border-radius: 5px;
            background-color: #f0f0f073;
            border: 1px solid rgba(57,108,240,0.1) ;
        }

        .sub-table{
            border: 1px solid #ebebeb;
            border-radius: 8px;
        }

        .filter-container{
            width: 92.5%;
            border: 1px solid #ebebeb;
            border-radius: 8px;
            margin-bottom: 20px;
            border-spacing: 0;
            padding: 0;
        }

       

       


        .menu-btn{
            padding:6px;
            color: #3b3b3b;
            background-position: 30% 50%;
            background-repeat: no-repeat;
            transition: 0.5s;
        }

        .menu-text{
            padding-left: 40%;
            font-weight: 100px;
            font-size: 16px;
        }

        .menu-active{
            color: var(--primarycolor);
            border-right: 7px solid var(--primarycolor);
            background-color: var();
        }

        .menu-btn:hover{
            background-color: var(--btnice);
            color: var(--primarycolor);
        }

        .non-style-link-menu:link, .non-style-link-menu:visited,  .non-style-link-menu:active{
            text-decoration: none;
            color: #3b3b3b;
        }

        .non-style-link-menu:hover{
            text-decoration: none;
            color: var(--primarycolor);
        }

        .non-style-link-menu-active:link, .non-style-link-menu-active:visited,  .non-style-link-menu-active:active{
            text-decoration: none;
            color: var(--primarycolor);
        }

        .setting-tabs:hover{
            background-color: #d6d6d657;
        }

        .doctor-header{
            background-image: url(../img/b8.jpg);
            color: rgba(0, 0, 0, 0.87);
            background-size: 100%;

            padding: 20px;
            padding-left: 30px;
        }



        .btn-book{
            background-image: url('../img/icons/book-balck.svg');
            background-position: 68% 50%;
            background-repeat: no-repeat;
            transition: 0.5s;
        }
        /*These transition are from youtube*/

@keyframes transitionIn-X{
    from {
            opacity: 0;
            transform: translateX(-10px);

    }

    to {
            opacity: 1;
            transform: translateX(0);
    }
}
    


@keyframes transitionIn-Y-over{
    from {
            opacity: 0;
            transform: translateY(-10px);

    }


}
    
@keyframes transitionIn-Y-bottom{
    from {
            opacity: 0;
            transform: translateY(30px);

    }

    to {
            opacity: 1;
            transform: translateY(0);
    }
}
    

/* Transition end */
.container{
    display: flex;
    flex-wrap: wrap;
    height: 100vh;


}
.menu{
    border-right: 1.5px solid rgb(235, 235, 235);
    width: 21%;
    height: 100vh;
    box-shadow: 0 0px 0px 2px rgba(240, 240, 240, 0.3);
}
.dash-body{
    width: 79%;
    height: 100vh;
}

.menu-container{
    width: 100%;
    border-spacing: 0;
    
}

.profile-title{
    font-weight: 500;
    color: #161c2d;
    font-size: 22px;
    margin: 0;
    text-align: left;
    padding-left: 8%;
}

.profile-subtitle{
    font-weight: 300;
    color: #8492a6;
    font-size: 15px;
    margin: 0;
    text-align: left;
    padding-left: 8%;
}

.logout-btn{
    margin-top: 30px;
    width: 85%;
}

.profile-container{
    border-bottom: 1.5px solid rgb(235, 235, 235);
    /*border-radius: 6px;*/
    padding-top: 18%;
    padding-bottom: 12%;
    /*box-shadow: 0 0 3px rgba(52,58,64,0.08);*/
    text-align: center;
    
}


/*.menu-items1{
    font-weight: 500;
    text-align: left;
    padding: 0;
    margin: 0;
    color: #161c2def;
    
}

.menu-td1{
    padding-right: 10px;
}


.menu-button:hover{
    cursor: pointer;
    background-color:var(--btnice);
}

.menu-active{
    color:var(--btnnicetext);
    
}

.menu-items1-active{
    color:var(--btnnicetext);
    background-image: url('../img/search.svg');
    background-position: 10px 50%;
    background-repeat: no-repeat;
}



*/

.heading-main12{
    font-weight: 500;
    font-size: 25px;
}

.heading-sub12{
    font-weight: 500;
    font-size: 20px;
    text-align: right;
}


.header-search{
    display: flex;
    justify-content: center;

    
}
.header-searchbar{
    width: 75%;
    background-color: rgba(255, 255, 255, 0.705);
    border: 0.5px solid rgba(190, 190, 190, 0.884);
    
    
}

.add-doc-form-container{
    padding: 25px;
    margin-top: 30px;
    
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
                                    <a href="logout.aspx"><input type="button" value="Cerrar Sesión" class="logout-btn btn-primary-soft btn"></a>
                                </td>
                            </tr>
                        </tbody></table>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-home">
                        <a href="inicioPaciente.aspx" class="non-style-link-menu">
                            </a><div><a href="inicioPaciente.aspx" class="non-style-link-menu">
                                <p class="menu-text">Inicio</p>
                        </a>
                        </div>
                        </td>
                    </tr>
                    <tr class="menu-row">
                        <td class="menu-btn menu-icon-citasPacientes">
                            <a href="citasPacientes.aspx" class="non-style-link-menu">
                                <div>
                                    <p class="menu-text">Citas</p>
                                </div>
                            </a>
                        </td>
                    </tr>
                    <tr class="menu-row">
                        <td class="menu-btn menu-icon-historial">
                            <a href="historial.aspx" class="non-style-link-menu">
                                </a><div><a href="historial.aspx" class="non-style-link-menu">
                                    <p class="menu-text">Mi Historial</p>
                            </a></div>
                        </td>
                    </tr>
                    <tr class="menu-row">
                        <td class="menu-btn menu-icon-configPaciente menu-active menu-icon-configPaciente-active">
                            <a href="configPaciente.aspx" class="non-style-link-menu non-style-link-menu-active">
                                </a><div><a href="configPaciente.aspx" class="non-style-link-menu non-style-link-menu-active">
                                    <p class="menu-text">Configuración</p>
                            </a></div>
                        </td>
                    </tr>

                    </tbody></table>
                    </div>
        <div class="dash-body" style="margin-top: 15px">
            <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;">

                <tr>

                    <td width="13%">
                        <a href="index.aspx"><button class="login-btn btn-primary-soft btn btn-icon-back" style="padding-top:11px;padding-bottom:11px;margin-left:20px;width:125px">
                                <font class="tn-in-text">Volver</font>
                            </button></a>
                    </td>
                    <td>
                        <p style="font-size: 23px;padding-left:12px;font-weight: 600;">Configuración</p>

                    </td>

                    <td width="15%">
                        <p style="font-size: 14px;color: rgb(119, 119, 119);padding: 0;margin: 0;text-align: right;">
                            Fecha
                        </p>
                        <p class="heading-sub12" style="padding: 0;margin: 0;">
                            Fecha actual
                        </p>
                    </td>
                    <td width="10%">
                        <button class="btn-label" style="display: flex;justify-content: center;align-items: center;"><img src="../img/calendar.svg" width="100%"></button>
                    </td>


                </tr>
                <tr>
                    <td colspan="4">

                        <center>
                            <table class="filter-container" style="border: none;" border="0">
                                <tr>
                                    <td colspan="4">
                                        <p style="font-size: 20px">&nbsp;</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <a href="?action=edit&id=<?aspx echo $userid ?>&error=0" class="non-style-link">
                                            <div class="dashboard-items setting-tabs" style="padding:20px;margin:auto;width:95%;display: flex">
                                                <div class="btn-icon-back dashboard-icons-setting" style="background-image: url('../img/icons/doctors-hover.svg');"></div>

                                                <a href="EditarCuenta.aspx">
                                                    <button class="login-btn btn-primary-soft btn btn-icon-back" style="padding-top: 11px; padding-bottom: 11px; margin-left: 20px; width: 125px;">
                                                        <font class="tn-in-text">Editar Cuenta</font>
                                                    </button>
                                                </a>



                                                <div>
                                                    <div class="h1-dashboard">
                                                        Configuración de Cuenta &nbsp;

                                                    </div><br>
                                                    <div class="h3-dashboard" style="font-size: 15px;">
                                                        Edita la información de tu Cuenta y Cambia la Contraseña
                                                    </div>
                                                </div>

                                            </div>
                                        </a>
                                    </td>


                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <p style="font-size: 5px">&nbsp;</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <a href="?action=view&id=<?aspx echo $userid ?>" class="non-style-link">
                                            <div class="dashboard-items setting-tabs" style="padding:20px;margin:auto;width:95%;display: flex;">
                                                <div class="btn-icon-back dashboard-icons-setting " style="background-image: url('../img/icons/view-iceblue.svg');"></div>

                                                <a href="InfoCuenta.aspx">
                                                    <button class="login-btn btn-primary-soft btn btn-icon-back" style="padding-top: 11px; padding-bottom: 11px; margin-left: 20px; width: 125px;">
                                                        <font class="tn-in-text">Info Cuenta</font>
                                                    </button>
                                                </a>


                                                <div>
                                                    <div class="h1-dashboard">
                                                        Ver Información de tu Cuenta

                                                    </div><br>
                                                    <div class="h3-dashboard" style="font-size: 15px;">
                                                        Ver la información personal de tu cuenta
                                                    </div>
                                                </div>

                                            </div>
                                        </a>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <p style="font-size: 5px">&nbsp;</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <a href="?action=drop&id=<?aspx echo $userid . '&name=' . $username ?>" class="non-style-link">
                                            <div class="dashboard-items setting-tabs" style="padding:20px;margin:auto;width:95%;display: flex;">
                                                <div class="btn-icon-back dashboard-icons-setting" style="background-image: url('../img/icons/patients-hover.svg');"></div>

                                                <a href="EliminarCuenta.aspx">
                                                    <button class="login-btn btn-primary-soft btn btn-icon-back" style="padding-top: 11px; padding-bottom: 11px; margin-left: 20px; width: 125px;">
                                                        <font class="tn-in-text">Eliminar Cuenta</font>
                                                    </button>
                                                </a>



                                                <div>
                                                    <div class="h1-dashboard" style="color: #ff5050;">
                                                        Eliminar Cuenta

                                                    </div><br>
                                                    <div class="h3-dashboard" style="font-size: 15px;">
                                                        Se eliminará permanentemente su cuenta
                                                    </div>
                                                </div>

                                            </div>
                                        </a>
                                    </td>

                                </tr>
                            </table>
                        </center>
                    </td>
                </tr>

            </table>
        </div>
    </div>



</body>

</html>
