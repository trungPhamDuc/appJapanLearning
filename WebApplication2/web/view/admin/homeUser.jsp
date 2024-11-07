
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách nhân viên | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="../view/css/css/main_1.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">        
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>
    <body class="app sidebar-mini rtl">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            if(session.getAttribute("account")==null){
               response.sendRedirect("/SWP391_Group6/login");
            }           
        %>
        <header class="app-header">
            <a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
               aria-label="Hide Sidebar"></a>

            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="/SWP391_Group6/logout"><i class='bx bx-log-out bx-rotate-180'></i> </a>
                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="../view/image/andanh.jpg" width="50px"                                               alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${sessionScope.account.username}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item haha" href="/SWP391_Group6/admin/home"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Bảng điều khiển</span></a></li>
                <li><a class="app-menu__item " href="/SWP391_Group6/admin/coursemanage"><i class='app-menu__icon bx bx-purchase-tag-alt'></i>
                        <span class="app-menu__label">Course</span></a></li>                
                <li><a class="app-menu__item " href="/SWP391_Group6/admin/lecturermanage"><i class='app-menu__icon bx bx-id-card'></i> <span
                            class="app-menu__label">Quản lý giáo viên</span></a></li>
                <li><a class="app-menu__item" href="/SWP391_Group6/admin/learnermanage"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Quản lý người học</span></a></li>
                <li><a class="app-menu__item" href="/SWP391_Group6/admin/viewfeedback"><i class='bx bx-message-rounded-dots'></i><span
                            class="app-menu__label">Quản lý phản hồi</span></a></li>
            </ul>
        </aside>
        <main class="app-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="app-title">
                        <ul class="app-breadcrumb breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><b>Bảng điều khiển</b></a></li>
                        </ul>
                        <div id="clock"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!--Left-->
                <div class="col-md-12 col-lg-6">
                    <div class="row">
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <a href="/SWP391_Group6/admin/lecturermanage">
                                <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
                                    <div class="info">
                                        <h4>Tổng số giáo viên</h4>
                                        <p><b>${requestScope.countLecturer} giáo viên</b></p>
                                        <p class="info-tong">Tổng số giáo viên được quản lý.</p>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <a href="/SWP391_Group6/admin/studycourse">
                                <div class="widget-small info coloured-icon"><i class='icon bx bx-user-voice fa-3x'></i>
                                    <div class="info">
                                        <h4>Tổng số người học</h4>
                                        <p><b>${requestScope.countUser} người học</b></p>
                                        <p class="info-tong">Tổng số người học được quản lý.</p>
                                    </div>
                                </div></a>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <a href="/SWP391_Group6/admin/checkpopular">
                                <div class="widget-small warning coloured-icon"><i class='icon bx bx-purchase-tag-alt fa-3x'></i>
                                    <div class="info">
                                        <h4>Tổng số khóa học</h4>
                                        <p><b>${requestScope.countCou} khóa học</b></p>
                                        <p class="info-tong">Tổng số khóa học được tạo.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small danger coloured-icon"><i class='icon bx bx-task fa-3x'></i>
                                <div class="info">
                                    <h4>Tổng số bài kiểm tra</h4>
                                    <p><b>20 bài kiểm tra</b></p>
                                    <p class="info-tong">Tổng số bài kiểm tra được tạo.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-12 -->
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title">Bảng Chữ Cái</h3>
                                <div>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Tên bảng</th>
                                                <th>Số người cập nhật</th>
                                                <th>Trạng thái</th>
                                            </tr>
                                        </thead>
                                        <tbody>                                           
                                            <tr>
                                                <td>Katagana</td>
                                                <td>
                                                    3
                                                </td>
                                                <td><span class="badge bg-success">Hoàn thành</span></td>
                                            </tr>
                                            <tr>
                                                <td>Hiragana</td>
                                                <td>
                                                    3	
                                                </td>
                                                <td><span class="badge bg-success">Hoàn thành</span></td>
                                            </tr>
                                            <tr>
                                                <td>Kanji</td>
                                                <td>
                                                    3	
                                                </td>
                                                <td><span class="badge bg-warning">Đang cập nhật</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- / div trống-->
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-md-12 col-lg-6">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title">Dữ liệu</h3>
                                <div class="embed-responsive embed-responsive-16by9">
                                    <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
                                </div>
                            </div>                          
                        </div>
                    </div>
                </div>

            </div>
            <div class="text-center" style="font-size: 13px">
                <p><b>Copyright || Phần mềm học tiếng nhật online
                    </b></p>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script type="text/javascript">
                var courseLabels = "<c:forEach items='${requestScope.courses}' var='c'>${c.course_name},</c:forEach>";
                    var CountsCourse = "<c:forEach items='${requestScope.counts}' var='count'>${count},</c:forEach>";
                        courseLabels = courseLabels.slice(0, -1).split(',');
                        CountsCourse = CountsCourse.slice(0, -1).split(',');
                        var data = {
                            labels: courseLabels,
                            datasets: [
                                {
                                    label: "Số người học",
                                    backgroundColor: "rgba(9, 109, 239, 0.2)",
                                    borderColor: "rgba(9, 109, 239, 1)",
                                    pointBackgroundColor: "rgba(9, 109, 239, 1)",
                                    pointBorderColor: "#fff",
                                    data: CountsCourse
                                }
                            ]
                        };

                        var ctx = document.getElementById("lineChartDemo").getContext("2d");
                        var lineChart = new Chart(ctx, {
                            type: 'line',
                            data: data,
                            options: {
                                responsive: true,
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
            </script>
        </main>
    </body>

</html>