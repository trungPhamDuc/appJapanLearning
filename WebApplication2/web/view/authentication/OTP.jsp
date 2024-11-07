

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>MÃ OTP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../css/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../css/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../css/css/vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="../css/css/vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="../css/vendor/select2/select2.min.css">
        <link rel="stylesheet" type="text/css" href="../css/css/util.css">
        <link rel="stylesheet" type="text/css" href="../css/css/main.css">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    </head>

    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="../image/OTP.jpg" alt="IMG">
                    </div>
                    <form class="login100-form validate-form" action="/SWP391_Group6/forgot" method="POST">
                        <span class="login100-form-title">
                            <b>Input OTP</b>
                        </span>
                        <div class="wrap-input100">
                            <input class="input100" type="text" placeholder="Input OTP" name="otp" maxlength="6" pattern="[0-9]+" required />
                            <input type="hidden" name="user" value="${sessionScope.username}">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class='bx bx-mail-send' ></i>
                            </span>
                        </div>
                        <div class="container-login100-form-btn">
                            <input type="submit" value="Confirm" />
                        </div>

                        <div class="text-center p-t-12">
                            <a class="txt2" href="/SWP391_Group6/login">
                                back login
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>


