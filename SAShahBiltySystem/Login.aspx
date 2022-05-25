<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SAShahBiltySystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8">

        <title>Login | Sale Business</title>

        <meta name="description" content="Created by Vals Development Team on Vals Technologies.">
        <meta name="author" content="ValsTechnologies">
        <meta name="robots" content="noindex, nofollow">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0">

        <!-- Icons -->
        <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
        <link rel="shortcut icon" href="../img/favicon.png">
        <link rel="apple-touch-icon" href="../img/icon57.png" sizes="57x57">
        <link rel="apple-touch-icon" href="../img/icon72.png" sizes="72x72">
        <link rel="apple-touch-icon" href="../img/icon76.png" sizes="76x76">
        <link rel="apple-touch-icon" href="../img/icon114.png" sizes="114x114">
        <link rel="apple-touch-icon" href="../img/icon120.png" sizes="120x120">
        <link rel="apple-touch-icon" href="../img/icon144.png" sizes="144x144">
        <link rel="apple-touch-icon" href="../img/icon152.png" sizes="152x152">
        <link rel="apple-touch-icon" href="../img/icon180.png" sizes="180x180">
        <!-- END Icons -->

        <!-- Stylesheets -->
        <!-- Bootstrap is included in its original form, unaltered -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">

        <!-- Related styles of various icon packs and plugins -->
        <link rel="stylesheet" href="../css/plugins.css">

        <!-- The main stylesheet of this template. All Bootstrap overwrites are defined in here -->
        <link rel="stylesheet" href="../css/main.css">

        <!-- Include a specific file here from css/themes/ folder to alter the default theme of the template -->

        <!-- The themes stylesheet of this template (for using specific theme color in individual elements - must included last) -->
        <link rel="stylesheet" href="../css/themes.css">
        <!-- END Stylesheets -->

        <!-- Modernizr (browser feature detection library) -->
        <script src="../js/vendor/modernizr.min.js"></script>
    </head>
    <body>
        
        <form id="mrFrm" runat="server"> 
            <!-- Login Full Background -->
            <!-- For best results use an image with a resolution of 1280x1280 pixels (prefer a blurred image for smaller file size) -->
            <img src="../img/placeholders/backgrounds/login_full_bg.jpg" alt="Login Full Background" class="full-bg animation-pulseSlow">
            <!-- END Login Full Background -->

            <!-- Login Container -->
            <div id="login-container" class="animation-fadeIn">
                <!-- Login Title -->
                <div class="login-title text-center">                    
                    <h1>
                        <img src="../assets/images/IS.png" width="30%" />
                        <br />
                        <small>Please <strong>Login</strong> or <strong>Register</strong></small>
                    </h1>
                </div>
                <!-- END Login Title -->

                <!-- Login Block -->
                <div class="block push-bit">
                    <!-- Login Form -->
                    <div id="form-login" class="form-horizontal form-bordered form-control-borderless">
                        <div class="form-group">
                            <div class="col-xs-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="gi gi-envelope"></i></span>
                                    <%--<input type="text" id="login-email" name="login-email" class="form-control input-lg" placeholder="Email">--%>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control input-lg" placeholder="Enter username"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="gi gi-asterisk"></i></span>
                                    <%--<input type="password" id="login-password" name="login-password" class="form-control input-lg" placeholder="Password">--%>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control input-lg" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-actions">
                            <div class="col-xs-4">
                                <label class="switch switch-primary" data-toggle="tooltip" title="Remember Me?">
                                    <input type="checkbox" id="login-remember-me" name="login-remember-me" checked>
                                    <span></span>
                                </label>
                            </div>
                            <div class="col-xs-8 text-right">
                                <div id="divNotification" style="margin-top: 10px;" runat="server"></div>
                                <%--<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> Login to Dashboard</button>--%>
                                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-sm btn-primary" OnClick="btnLogin_Click" Text=" Login to Dashboard" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 text-center">
                                <a href="javascript:void(0)" id="link-reminder-login"><small>Forgot password?</small></a> -
                                <a href="javascript:void(0)" id="link-register-login"><small>Create a new account</small></a>
                            </div>
                        </div>
                    </div>
                    <!-- END Login Form -->
                </div>
                <!-- END Login Block -->
            </div>
            <!-- END Login Container -->

            <!-- Modal Terms -->
            <div id="modal-terms" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Terms &amp; Conditions</h4>
                        </div>
                        <div class="modal-body">
                            <h4>Title</h4>
                            <p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <h4>Title</h4>
                            <p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <h4>Title</h4>
                            <p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Modal Terms -->
            </form>
        <!-- jQuery, Bootstrap.js, jQuery plugins and Custom JS code -->
        <script src="../js/vendor/jquery.min.js"></script>
        <script src="../js/vendor/bootstrap.min.js"></script>
        <script src="../js/plugins.js"></script>
        <script src="../js/app.js"></script>

        <!-- Load and execute javascript code used only in this page -->
        <script src="../js/pages/login.js"></script>
        <script>$(function(){ Login.init(); });</script>
    </body>




<%--<head runat="server">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta charset="utf-8" />
        <title>Bilty System : Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        
        <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon" />    <!-- Favicon -->
        <link rel="apple-touch-icon-precomposed" href="../assets/images/apple-touch-icon-57-precomposed.png">	<!-- For iPhone -->
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/images/apple-touch-icon-114-precomposed.png">    <!-- For iPhone 4 Retina display -->
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/images/apple-touch-icon-72-precomposed.png">    <!-- For iPad -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/images/apple-touch-icon-144-precomposed.png">    <!-- For iPad Retina display -->




        <!-- CORE CSS FRAMEWORK - START -->
        <link href="../assets/plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/plugins/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/fonts/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/animate.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/plugins/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" type="text/css"/>
        <!-- CORE CSS FRAMEWORK - END -->

        <!-- HEADER SCRIPTS INCLUDED ON THIS PAGE - START --> 
        
        
<link href="../assets/plugins/icheck/skins/all.css" rel="stylesheet" type="text/css" media="screen"/>

        <!-- HEADER SCRIPTS INCLUDED ON THIS PAGE - END --> 


        <!-- CORE CSS TEMPLATE - START -->
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/responsive.css" rel="stylesheet" type="text/css"/>
        <!-- CORE CSS TEMPLATE - END -->
</head>
<body class=" login_page">
    <form id="mrFrm" runat="server">    
        <div class="container-fluid">
            <div class="login-wrapper row">
                <div id="login" class="login loginpage col-lg-offset-4 col-md-offset-3 col-sm-offset-3 col-xs-offset-0 col-xs-12 col-sm-6 col-lg-4">
                    <h1><a href="#" title="Login Page" tabindex="-1">Complete Admin</a></h1>
                    <div id="divNotification" style="margin-top: 10px;" runat="server"></div>
                    <form name="loginform" id="loginform" action="index.html" method="post">
                        <p>
                            <label for="user_login">
                                Username<br />
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="input"></asp:TextBox></label>
                        </p>
                        <p>
                            <label for="user_pass">
                                Password<br />
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" style="font-size: 19px; width: 100%; padding: 9px; line-height: 25px; margin: 5px 0 15px 0; border: 1px solid transparent !important; background-color: rgba(255, 255, 255, 0.6) /*#ffffff*/;"></asp:TextBox></label>
                        </p>



                        <p class="submit">
                            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-accent btn-block" OnClick="btnLogin_Click" Text="Sign In" />
                        </p>
                    </form>

                    <p id="nav">
                        <a class="pull-left" href="#" title="Password Lost and Found">Forgot password?</a>
                        <a class="pull-right" href="ui-register.html" title="Sign Up">Sign Up</a>
                    </p>


                </div>
            </div>
        </div>
    </form>



    <!-- MAIN CONTENT AREA ENDS -->
    <!-- LOAD FILES AT PAGE END FOR FASTER LOADING -->


    <!-- CORE JS FRAMEWORK - START -->
    <script src="../assets/js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="../assets/js/jquery.easing.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/pace/pace.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/viewport/viewportchecker.js" type="text/javascript"></script>
    <script>window.jQuery || document.write('<script src="../assets/js/jquery-1.11.2.min.js"><\/script>');</script>
    <!-- CORE JS FRAMEWORK - END -->


    <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START -->

    <script src="../assets/plugins/icheck/icheck.min.js" type="text/javascript"></script>
    <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END -->


    <!-- CORE TEMPLATE JS - START -->
    <script src="../assets/js/scripts.js" type="text/javascript"></script>
    <!-- END CORE TEMPLATE JS - END -->


</body>--%>


</html>
