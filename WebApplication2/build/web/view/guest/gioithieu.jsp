<%-- 
    Document   : gioithieu
    Created on : Jun 11, 2024, 4:48:46 PM
    Author     : ngoki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">   
        <title>JSP Page</title>

    </head>
    <body>
        <header class="bg-dark text-white py-4"> 
            <div class="container">
                <h1 class="display-4">Giới thiệu Web học tiếng Nhật online</h1> 
                <p class="lead">Nhận ưu đãi đặc biệt khi đăng ký ngay hôm nay!</p> 
            </div>
        </header>
        <main>
            <section class="py-5 bg-light">
                <div class="container">
                    <h2 class="mb-4">Học Tiếng Nhật Cùng Chúng Tôi</h2>
                    <p>Tại đây, chúng tôi cung cấp các khóa học tiếng Nhật chất lượng cao, phù hợp với mọi trình độ và nhu cầu của bạn.</p>
                </div>
            </section>

            <section class="py-5">
                <div class="container">
                    <h2 class="mb-4">Tại Sao Lại Chọn Chúng Tôi?</h2>
                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <div class="card h-100">
                                <img src="../image/1.png" class="card-img-top" alt="Feature 1">
                                <div class="card-body">
                                    <h3 class="card-title">Giáo Trình Chuyên Nghiệp</h3>
                                    <p class="card-text">Đội ngũ giáo viên của chúng tôi được đào tạo bài bản, giàu kinh nghiệm và tâm huyết với sự nghiệp giảng dạy.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="card h-100">
                                <img src="../image/2.jpg" class="card-img-top" alt="Feature 2">
                                <div class="card-body">
                                    <h3 class="card-title">Phương Pháp Hiệu Quả</h3>
                                    <p class="card-text">Chúng tôi áp dụng các phương pháp giảng dạy tiên tiến, kết hợp lý thuyết và thực hành để giúp bạn nắm vững kiến thức.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="card h-100">
                                <img src="../image/3.jpg" class="card-img-top" alt="Feature 3">
                                <div class="card-body">
                                    <h3 class="card-title">Môi Trường Học Tập Tích Cực</h3>
                                    <p class="card-text">Bạn sẽ được trải nghiệm một môi trường học tập thân thiện, hứng thú và hỗ trợ từ các bạn cùng lớp.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="py-5 bg-light">
                <div class="container text-center">
                    <h2 class="mb-4">Đăng Ký Ngay Hôm Nay</h2>
                    <p class="mb-4">Bắt đầu hành trình học tiếng Nhật của bạn với chúng tôi. Đăng ký ngay để nhận ưu đãi đặc biệt.</p>
                    <a href="../authentication/signup.jsp" class="btn btn-primary"><b>Đăng Ký Ngay</b></a><br>                   
                </div>
                <div class="container text-center">
                    <a href="/SWP391_Group6/user/home" class="btn btn-primary" style="margin-top: 20px"><b>Trở về trang chủ</b></a><br>
                </div>
            </section>
        </main>
    </body>
</html>
