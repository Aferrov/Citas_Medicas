<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicioDoc.aspx.cs" Inherits="Citas_Medicas.WebForm3" %>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/animations.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="icon" type="image/png" sizes="16x16" href="../img/logo.png">

    <title>Inicio</title>
    <style>
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
                                    <asp:Label ID="LabelNombre" runat="server" Text="Nombre"></asp:Label>
                                    <asp:Label ID="LabelCorreo" runat="server" Text="Correo"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="Pagina_Inicio.aspx"><input type="button" value="Cerrar Sesión" class="logout-btn btn-primary-soft btn"></a>
                                </td>
                            </tr>
                        </tbody></table>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-home menu-active menu-icon-home-active">
                        <a href="inicioDoc.aspx" class="non-style-link-menu non-style-link-menu-active">
                            </a><div><a href="inicioDoc.aspx" class="non-style-link-menu non-style-link-menu-active">
                                <p class="menu-text">Inicio</p>
                        </a>
                    </div>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-pacientes">
                        <a href="pacientes.aspx" class="non-style-link-menu">
                            <div>
                                <p class="menu-text">Pacientes</p>
                            </div>
                        </a>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-configDoc">
                        <a href="configDoc.aspx" class="non-style-link-menu">
                            </a><div><a href="configDoc.aspx" class="non-style-link-menu">
                                <p class="menu-text">Configuración</p>
                        </a></div>
                    </td>
                </tr>
               

    </tbody></table>
    </div>
    <form runat="server">
    <div class="dash-body" style="margin-top: 15px">
        <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;">

            <tbody><tr>

                <td colspan="1" class="nav-bar">
                    <p style="font-size: 23px;padding-left:12px;font-weight: 600;margin-left:20px;">Inicio</p>

                </td>
                <td width="25%">

                </td>
                <td width="15%">
                    <p style="font-size: 14px;color: rgb(119, 119, 119);padding: 0;margin: 0;text-align: right;">
                        Fecha
                    </p>
                    <p class="heading-sub12" style="padding: 0;margin: 0;">
                        2023-06-27</p>
                </td>
                <td width="10%">
                    <button class="btn-label" style="display: flex;justify-content: center;align-items: center;"><img src="../img/calendar.svg" width="100%"></button>
                </td>

            </tr>
            <tr>
                <td colspan="4">

                    <center>
                        
                        <table class="filter-container doctor-header patient-header" style="border: none;width:95%" border="0">
                            <tbody><tr>
                                <td>
                                    <h3>Bienvenido Doctor!</h3>
                                    <asp:Label ID="LabelNombre2" runat="server" Text="Nombre"></asp:Label>
                                </td>
                                    
                                </td>
                            </tr>
                        </table>
                       
                    </center>
            </tbody>

                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <table border="0" width="100%" "="">
                            <tbody><tr>
                                <td width=" 50%">


                    <p style="font-size: 20px;font-weight:600;padding-left: 80px;" class="anime"></p>
                    <center>
                        <div class="abc scroll" style="height: 600px;padding: 0;margin: 0;">
                            <table width="0%" class="sub-table scrolldown" border="0">
                                <asp:Table ID="citas_medico" runat="server">
                                    <asp:TableHeaderRow>
                                        <asp:TableHeaderCell>Nro Citas</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Paciente</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Fecha y Hora</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Acciones</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                </asp:Table>
                                
                                </tbody>
                            </table>
                        </div>
                    </center>

                </td>
            </tr>
        </tbody></table>
        </td>
        </tr></tbody></table>
       </form>
    </div>
    </div>




</body>

</html>
