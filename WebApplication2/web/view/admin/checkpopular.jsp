
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách Khóa Học</title>
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
            <li><a class="app-menu__item haha" href="/SWP391_Group6/admin/coursemanage"><i class='app-menu__icon bx bx-purchase-tag-alt'></i>
                    <span class="app-menu__label">Course</span></a></li>                
            <li><a class="app-menu__item" href="/SWP391_Group6/admin/lecturermanage"><i class='app-menu__icon bx bx-id-card'></i> <span
                        class="app-menu__label">Quản lý giáo viên</span></a></li>
            <li><a class="app-menu__item " href="/SWP391_Group6/admin/learnermanage"><i class='app-menu__icon bx bx-user-voice'></i><span
                        class="app-menu__label">Quản lý người học</span></a></li>
            <li><a class="app-menu__item" href="/SWP391_Group6/admin/viewfeedback"><i class='bx bx-message-rounded-dots'></i><span
                        class="app-menu__label">Quản lý phản hồi</span></a></li>
        </ul>
    </aside>
    <main class="app-content">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item active"><a href="#"><b>Danh sách khóa học</b></a></li>
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
                                    <option value="">All</option>
                                    <option value="mostPopular">Select most popular</option>
                                </select>
                            </div>

                        </div>
                        <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0" id="sampleTable">
                            <thead>
                                <tr>
                                    <th>User_ID</th>
                                    <th width="auto">Username</th>
                                    <th width="auto">Course_ID</th>
                                    <th>Course_name</th>
                                    <th>Count</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.studentcous}" var="stcou">
                                    <tr>
                                        <td>${stcou.account.userid}</td>
                                        <td>${stcou.account.username}</td>
                                        <td>${stcou.course.course_id}</td>
                                        <td>${stcou.course.course_name}</td>
                                        <td class="count-cell">1</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const filterSelect = document.getElementById('usernameFilter');
            const rows = Array.from(document.querySelectorAll('#sampleTable tbody tr'));
            const countHeaders = document.querySelectorAll('.count-header');
            const countCells = document.querySelectorAll('.count-cell');

            filterSelect.addEventListener('change', function () {
                const filterValue = this.value;
                const counts = {};
                rows.forEach(row => {
                    const courseId = row.cells[2].innerText;
                    counts[courseId] = (counts[courseId] || 0) + 1;
                });
                rows.forEach(row => {
                    const courseId = row.cells[2].innerText; 
                    row.querySelector('.count-cell').innerText = counts[courseId];
                });

                if (filterValue === 'mostPopular') {
                    countHeaders.forEach(header => header.style.display = '');
                    countCells.forEach(cell => cell.style.display = '');

                    const headers = document.querySelectorAll('#sampleTable thead th');
                    headers[0].style.display = 'none'; 
                    headers[1].style.display = 'none'; 

                    rows.forEach(row => {
                        row.cells[0].style.display = 'none'; 
                        row.cells[1].style.display = 'none'; 
                    });

                    let maxCount = 0;
                    let mostPopularID = '';
                    for (const id in counts) {
                        if (counts[id] > maxCount) {
                            maxCount = counts[id];
                            mostPopularID = id;
                        }
                    }

                    rows.forEach(row => row.style.display = 'none');

                    let displayed = false;
                    rows.forEach(row => {
                        if (row.cells[2].innerText === mostPopularID && !displayed) {
                            row.style.display = '';
                            displayed = true; 
                        }
                    });
                } else {

                    countHeaders.forEach(header => header.style.display = 'none');
                    countCells.forEach(cell => cell.style.display = 'none');

                    const headers = document.querySelectorAll('#sampleTable thead th');
                    headers.forEach(header => header.style.display = '');

                    rows.forEach(row => {
                        row.cells[0].style.display = ''; 
                        row.cells[1].style.display = ''; 
                        row.style.display = '';
                    });
                }
            });

            filterSelect.dispatchEvent(new Event('change'));
        });

    </script>

</body>

</html>