
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách người học | Quản trị Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../view/css/css/main_1.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">        
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <style>
        </style>
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
            aria-label="Hide Sidebar"></a>
        <ul class="app-nav">

            <li><a class="app-nav__item" href="/SWP391_Group6/logout"><i class='bx bx-log-out bx-rotate-180'></i> </a>

            </li>
        </ul>
    </header>
    <!-- Sidebar menu-->
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
            <li><a class="app-menu__item " href="/SWP391_Group6/admin/coursemanage"><i class='app-menu__icon bx bx-purchase-tag-alt'></i>
                    <span class="app-menu__label">Course</span></a></li>                
            <li><a class="app-menu__item" href="/SWP391_Group6/admin/lecturermanage"><i class='app-menu__icon bx bx-id-card'></i> <span
                        class="app-menu__label">Quản lý giáo viên</span></a></li>
            <li><a class="app-menu__item haha" href="/SWP391_Group6/admin/learnermanage"><i class='app-menu__icon bx bx-user-voice'></i><span
                        class="app-menu__label">Quản lý người học</span></a></li>
            <li><a class="app-menu__item" href="/SWP391_Group6/admin/viewfeedback"><i class='bx bx-message-rounded-dots'></i><span
                        class="app-menu__label">Quản lý phản hồi</span></a></li>
        </ul>
    </aside>
    <main class="app-content">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item active"><a href="#"><b>Danh sách người học</b></a></li>
            </ul>
            <div id="clock"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <div class="row mb-3">
                            <div class="col-sm-4">
                                <select id="usernameFilter" class="form-control">
                                    <option value="">Select Username</option>

                                    <c:forEach items="${requestScope.usernames}" var="name">                                       
                                        <option value="${name}">${name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <select id="courseNameFilter" class="form-control">
                                    <option value="">Select Course Name</option>

                                    <c:forEach items="${requestScope.courses}" var="cou">
                                        <option value="${cou.course_name}">${cou.course_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <select id="statusFilter" class="form-control">
                                    <option value="">Select Status</option>
                                    <option value="studying">studying</option>
                                    <option value="done">done</option>
                                </select>
                            </div>
                        </div>
                        <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                               id="sampleTable">
                            <thead>
                                <tr>
                                    <th>User_ID</th>
                                    <th width="auto">Username</th>
                                    <th width="auto">Course_ID</th>
                                    <th>CourseName</th>
                                    <th>Progress</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.studentcous}" var="stcou">
                                    <tr>
                                        <td>${stcou.account.userid}</td>
                                        <td>${stcou.account.username}</td>
                                        <td>${stcou.course.course_id}</td>
                                        <td>${stcou.course.course_name}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${stcou.enroll.progress == null || stcou.enroll.progress < 100}">
                                                    <span style="color: red; border: 2px solid red; border-radius: 10px; padding: 2px;">studying</span>
                                                </c:when>
                                                <c:when test="${stcou.enroll.progress == 100}">
                                                    <span style="color: green; border: 2px solid green; border-radius: 10px; padding: 2px;">done</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>                              
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script>
        document.getElementById('usernameFilter').addEventListener('change', filterTable);
        document.getElementById('courseNameFilter').addEventListener('change', filterTable);
        document.getElementById('statusFilter').addEventListener('change', filterTable);

        function filterTable(
            const usernameFilter = document.getElementById('usernameFilter').value.toLowerCase();
            const courseNameFilter = document.getElementById('courseNameFilter').value.toLowerCase();
            const statusFilter = document.getElementById('statusFilter').value.toLowerCase();
            const table = document.getElementById('sampleTable');
            const rows = table.getElementsByTagName('tr');

            for (let i = 1; i < rows.length; i++) { // Start at 1 to skip the header row
                const cells = rows[i].getElementsByTagName('td');
                const username = cells[1].textContent.toLowerCase();
                const courseName = cells[3].textContent.toLowerCase();
                const status = cells[4].textContent.toLowerCase();
                let display = true;

                if (usernameFilter && username !== usernameFilter)
                    display = false;
                if (courseNameFilter && courseName !== courseNameFilter)
                    display = false;
                if (statusFilter && !status.includes(statusFilter))
                    display = false;

                rows[i].style.display = display ? '' : 'none';
            }
        }
    </script>

</body>

</html>