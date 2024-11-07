
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
    <style>
        .status-cell {
            border: 2px solid;
            border-radius: 40%;;
            width: 60px; 
        }

        .status-cell.active {
            color: green;
        }

        .status-cell.ban {
            color: red;
        }
    </style>
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
        <form id="deleteForm" action="/SWP391_Group6/admin/deleteallstudent" method="POST">
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">

                            <div class="col-sm-2">
                                <button type="submit" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i>Xóa tất cả</button>
                            </div>
                            <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                                   id="sampleTable">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="selectAll"></th>
                                        <th>Tên Đăng Nhập</th>
                                        <th width="150">Email</th>
                                        <th>Giới tính</th>
                                        <th>SĐT</th>
                                        <th>Chức vụ</th>
                                        <th>Trạng thái</th>
                                        <th width="150">Tính năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listLearner}" var="learner">
                                        <tr>
                                            <td width="10"><input type="checkbox" name="selectedItems" value="${learner.username}"></td>
                                            <td>${learner.username}</td>
                                            <td>${learner.email}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${learner.gender == true}">
                                                        male
                                                    </c:when>
                                                    <c:otherwise>
                                                        female
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${learner.phone}</td>
                                            <td>${learner.userType}</td>
                                            <td class="status-cell ${learner.status == 'active' ? 'active' : 'ban'}">${learner.status}</td>
                                            <td>
                                                <select class="status-select" data-username="${learner.username}">
                                                    <option value="active" <c:if test="${learner.status == 'active'}">selected</c:if>>Active</option>
                                                    <option value="ban" <c:if test="${learner.status == 'ban'}">selected</c:if>>Ban</option>
                                                    </select>                                   
                                                </td>
                                            </tr>                              
                                    </c:forEach>
                                </tbody>
                                <script>
                                    const selectAllCheckbox = document.getElementById('selectAll');
                                    const selectedItemsCheckboxes = document.querySelectorAll('input[name="selectedItems"]');
                                    const deleteForm = document.getElementById('deleteForm');
                                    const statusSelects = document.querySelectorAll('.status-select');

                                    selectAllCheckbox.addEventListener('change', function () {
                                        selectedItemsCheckboxes.forEach(checkbox => {
                                            checkbox.checked = this.checked;
                                        });
                                    });

                                    deleteForm.addEventListener('submit', function (event) {
                                        if (confirm('Bạn có chắc chắn muốn xóa các mục đã chọn?')) {
                                            return true;
                                        } else {
                                            event.preventDefault();
                                        }
                                    });
                                    statusSelects.forEach(select => {
                                        select.addEventListener('change', function () {
                                            const username = this.getAttribute('data-username');
                                            const status = this.value;

                                            fetch(`/SWP391_Group6/admin/updateStatus`, {
                                                method: 'POST',
                                                headers: {
                                                    'Content-Type': 'application/json',
                                                },
                                                body: JSON.stringify({username, status}),
                                            })
                                                    .then(response => response.json())
                                                    .then(data => {
                                                        if (data.success) {
                                                            alert('Status updated successfully');
                                                        } else {
                                                            alert('Failed to update status');
                                                        }
                                                    })
                                                    .catch(error => {
                                                        console.error('Error:', error);
                                                        alert('An error occurred while updating status');
                                                    });
                                        });
                                    });
                                </script>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </main>

</body>

</html>