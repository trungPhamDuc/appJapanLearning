

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Khôi phục mật khẩu | Website quản trị v2.0</title>
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
                        <img src="../image/fg-img.png" alt="IMG">
                    </div>
                    <form class="login100-form validate-form" action="/SWP391_Group6/create" method="POST" id="myForm" onsubmit="return checkPasswords(event)">
                        <span class="login100-form-title">
                            <b>NEW PASS</b>
                        </span>
                        <div class="wrap-input100">
                            <input class="input100" type="password" placeholder="Nhập newpass" name="newpass" id="newpass" required/>
                            <div class="invalid-feedback" id="passwordFeedback"></div>
                            <input type="hidden" value="${sessionScope.username}" name="username">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class='bx bx-mail-send' ></i>
                            </span>
                        </div>
                        <div class="wrap-input100">
                            <input class="input100" type="password" placeholder="Xác nhận newpass" name="confirm_newpass" id="confirm_newpass" required />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class='bx bx-mail-send' ></i>
                            </span>
                        </div>
                        <div class="container-login100-form-btn">
                            <input type="submit" value="Confirm"/>
                        </div>
                        <script>
                            function validatePassword() {
                                const passwordInput = document.getElementById('newpass');
                                const passwordFeedback = document.getElementById('passwordFeedback');

                                const password = passwordInput.value.trim();
                                if (password.length < 6) {
                                    passwordInput.classList.add('is-invalid');
                                    passwordFeedback.textContent = 'Password phải có ít nhất 6 ký tự';
                                    return false;
                                } else if (!/[a-z]/.test(password) || !/[A-Z]/.test(password) || !/\d/.test(password)) {
                                    passwordInput.classList.add('is-invalid');
                                    passwordFeedback.textContent = 'Password phải chứa ít nhất một chữ thường, một chữ hoa và một số';
                                    return false;
                                } else {
                                    passwordInput.classList.remove('is-invalid');
                                    passwordFeedback.textContent = '';
                                    return true;
                                }
                            }
                            
                            function checkPasswords(event) {
                                event.preventDefault();
                                const newpass = document.getElementById("newpass").value;
                                const confirm_newpass = document.getElementById("confirm_newpass").value;

                                if (newpass !== confirm_newpass) {
                                    alert("Mật khẩu mới và xác nhận mật khẩu không giống nhau. Vui lòng kiểm tra lại.");
                                    return false;
                                } else {
                                    if(validatePassword()){
                                        document.getElementById("myForm").submit();
                                    } else{
                                        alert(passwordFeedback.textContent);
                                    }                                 
                                }
                            }
                        </script>
                        <div class="text-center p-t-12">
                            <a class="txt2" href="/SWP391_Group6/login">
                                Trở về đăng nhập
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>