



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách khóa học</title>
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
            <ul class="app-nav">

                <li><a class="app-nav__item" href="/SWP391_Group6/logout"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="../view/image/andanh.jpg" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${sessionScope.account.username}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="/SWP391_Group6/admin/home"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Bảng điều khiển</span></a></li>
                <li><a class="app-menu__item haha " href="/SWP391_Group6/admin/coursemanage"><i class='app-menu__icon bx bx-purchase-tag-alt'></i>
                        <span class="app-menu__label">Course</span></a></li>                
                <li><a class="app-menu__item" href="/SWP391_Group6/admin/lecturermanage"><i class='app-menu__icon bx bx-id-card'></i> <span
                            class="app-menu__label">Quản lý giáo viên</span></a></li>
                <li><a class="app-menu__item" href="/SWP391_Group6/admin/learnermanage"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Quản lý người học</span></a></li>
                <li><a class="app-menu__item" href="/SWP391_Group6/admin/viewfeedback"><i class='bx bx-message-rounded-dots'></i><span
                            class="app-menu__label">Quản lý phản hồi</span></a></li>
            </ul>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="">Danh sách khóa học</a></li>
                </ul>
            </div>
            <div class="container-fluid al">
                <div id="clock"></div>
                <Br>
                <p class="quanlyphanhoi"><b>QUẢN LÝ KHÓA HỌC:</b></p><Br><Br>

                <table class="table table-bordered" id="myTable">
                    <thead>
                        <tr class="ex">
                            <th width="200px">ID</th>
                            <th width="auto">tên khóa học</th>
                            <th width="1000px; !important">miêu tả</th>
                            <th width="150">Tính năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.courses}" var="cour">
                            <tr>
                                <th width="auto">${cour.course_id}</th>
                                <th width="auto">${cour.course_name}</th>
                                <th>${cour.course_description}</th>
                                <td class="table-td-center">
                                    <form action="/SWP391_Group6/admin/deletecourse" method="POST">
                                        <input type="submit" class="btn btn-primary btn-sm trash" value="Xóa">
                                        <input type="hidden" value="${cour.course_id}" name="courID">
                                    </form>
                                    <form action="/SWP391_Group6/admin/viewlesson" method="POST">
                                        <input type="submit" class="btn btn-primary btn-sm edit" value="Detail">
                                        <input type="hidden" value="${cour.course_id}" name="courID">
                                    </form>                                                                   
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <hr class="hr1">
            <div class="container-fluid end">
                <div class="row text-center">
                    <div class="col-lg-12 link">
                        <i class="fab fa-facebook-f"></i>
                        <i class="fab fa-instagram"></i>
                        <i class="fab fa-youtube"></i>
                        <i class="fab fa-google"></i>
                    </div>
                    <div class="col-lg-12">
                        2019 CopyRight Phan mem tu hoc tieng nhat | Design by G6
                    </div>
                </div>
            </div>
        </main>
    </body>

</html>
