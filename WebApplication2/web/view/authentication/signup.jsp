<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-12 col-xl-11">
                        <div class="card text-black" style="border-radius: 25px;">
                            <div class="card-body p-md-5">
                                <div class="row justify-content-center">
                                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                        <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                                        <form class="mx-1 mx-md-4" action="signup" method="POST">

                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                                <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                                    <label for="email">Email</label>
                                                    <input type="text" class="form-control" id="email" name="email" placeholder="Email" required>
                                                </div>
                                            </div>

                                            
                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                                <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                                    <label for="user">Username</label>
                                                    <input type="text" class="form-control" id="user" name="user" placeholder="(more than 8 characters )" required>
                                                    <div class="invalid-feedback" id="usernameFeedback"></div>
                                                </div>
                                            </div>
                                            
                                            
                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                                <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                                    <label for="pass">Password</label>
                                                    <input type="password" class="form-control" id="pass" name="pass" placeholder="Password (more than 6 characters) (contains capital letters)" required>
                                                    <div class="invalid-feedback" id="passwordFeedback"></div>
                                                </div>
                                            </div>

                                            

                                            <script>
                                                
                                                const usernameInput = document.getElementById('user');
                                                const passwordInput = document.getElementById('pass');

                                                
                                                const usernameFeedback = document.getElementById('usernameFeedback');
                                                const passwordFeedback = document.getElementById('passwordFeedback');
                                                
                                                function validateUsername() {
                                                    const username = usernameInput.value.trim();
                                                    if (username.length < 8) {
                                                        usernameInput.classList.add('is-invalid');
                                                        usernameFeedback.textContent = 'Username phải có ít nhất 8 ký tự';
                                                        return false;
                                                    } else {
                                                        usernameInput.classList.remove('is-invalid');
                                                        usernameFeedback.textContent = '';
                                                        return true;
                                                    }
                                                }

                                                
                                                function validatePassword() {
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

                                                
                                                usernameInput.addEventListener('keyup', validateUsername);
                                                passwordInput.addEventListener('keyup', validatePassword);

                                                
                                                const form = document.querySelector('form');
                                                form.addEventListener('submit', (event) => {
                                                    event.preventDefault();
                                                    if (validateUsername() && validatePassword()) {
                                                        form.submit();
                                                    }
                                                });
                                            </script>

                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                                <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                                    <label for="phone">Phone</label>
                                                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone" required>
                                                </div>
                                            </div>

                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                                                <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                                    <label>Gender</label><br>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="gender" id="genderBoy" value="1" required>
                                                        <label class="form-check-label" for="genderBoy">Male</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="gender" id="genderGirl" value="0" required>
                                                        <label class="form-check-label" for="genderGirl">Fmale</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                                <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                                    <input class="form-check-input" type="radio" name="role" id="roleStudent" value="student" required>
                                                    <label class="form-check-label" for="roleStudent">Student</label>
                                                </div>
                                            </div>

                                            <div class="form-check d-flex justify-content-center mb-5">
                                                <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3c" required/>
                                                <label class="form-check-label" for="form2Example3">
                                                    I agree all statements in <a href="view/authentication/dieukhoan.jsp">Terms of service</a>
                                                </label>
                                            </div>

                                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                                <button  type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg">Confirm</button>
                                            </div>

                                        </form>

                                    </div>
                                    <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                                             class="img-fluid" alt="Sample image">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>