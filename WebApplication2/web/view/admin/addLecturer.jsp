
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Thêm giảng viên | Quản trị Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../css/css/main_1.css">
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
            aria-label="Hide Sidebar"></a>
        <ul class="app-nav">

            <li><a class="app-nav__item" href="/SWP391_Group6/logout"><i class='bx bx-log-out bx-rotate-180'></i> </a>
            </li>
        </ul>
    </header>
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
        <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="../image/andanh.jpg" width="50px"
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
            <li><a class="app-menu__item haha" href="/SWP391_Group6/admin/lecturermanage"><i class='app-menu__icon bx bx-id-card'></i> <span
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
                <li class="breadcrumb-item">Danh sách nhân viên</li>
                <li class="breadcrumb-item"><a href="#">Thêm nhân viên</a></li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">

                <div class="tile">

                    <h3 class="tile-title">Tạo mới nhân viên</h3>
                    <div class="tile-body">

                        <form class="row" action="/SWP391_Group6/admin/addlecturer" method="POST">
                            <div class="form-group col-md-4">
                                <label class="control-label">Tên đăng nhập</label>
                                <input class="form-control" type="text" name="username" required>
                            </div>
                            <div>
                                <input class="form-control" type="hidden" value="123" name="password">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label">Địa chỉ email</label>
                                <input class="form-control" type="text" name="email" required>
                            </div>

                            <div class="form-group  col-md-4">
                                <label class="control-label">Số điện thoại</label>
                                <input class="form-control" type="number" name="phone" required>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label">Giới tính</label>
                                <select class="form-control" id="exampleSelect2" name="gender" required>
                                    <option>-- Chọn giới tính --</option>
                                    <option value="1">Male</option>
                                    <option value="0">Fmale</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label">Chức vụ</label>
                                <select class="form-control" id="exampleSelect2" name="role" value="instructor" required>
                                    <option value="instructor">Giảng viên</option>
                                </select>
                            </div>

                            <div class="form-group col-md-4">
                            </div>
                            <div class="form-group col-md-4">
                            </div>
                            <div class="form-group col-md-4">
                            </div>
                            <div class="form-group col-md-4">
                            </div>
                            

                            <button class="btn btn-save" type="submit">Lưu lại</button>
                            <a class="btn btn-cancel" href="../admin/LecturerManage.jsp">Hủy bỏ</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>