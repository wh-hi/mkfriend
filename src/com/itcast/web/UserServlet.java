package com.itcast.web;

import com.itcast.pojo.Page;
import com.itcast.pojo.User;
import com.itcast.service.UserService;
import com.itcast.service.impl.UserServiceimpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

public class UserServlet extends HttpServlet {

    UserService userService = new UserServiceimpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
//        System.out.println(action);
        if ("register".equals(action)) {
            regist(request, response);
        } else if ("login".equals(action)) {
            login(request, response);
        } else if ("logout".equals(action)) {
            logout(request, response);
        } else if ("uploadphoto".equals(action)) {
            uploadphoto(request, response);
        } else if ("page".equals(action)) {
            page(request, response);
        } else if ("queryOne".equals(action)) {
            queryOne(request, response);
        } else if ("changePassword".equals(action)) {
            changePassword(request, response);
        } else if ("updateMess".equals(action)) {
            updateMess(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    protected void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");
        if (userService.existsUsername(username)) {
            System.out.println("用户名[" + username + "]已存在！");
            request.setAttribute("msg", "用户名已存在！");
            request.setAttribute("username", username);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("message", message);
            request.getRequestDispatcher("/pages/user/register.jsp").forward(request, response);
        } else {
            request.setAttribute("username", username);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("message", message);
            userService.registUser(new User(null, username, password, phone, email, message, null));
            request.getRequestDispatcher("/pages/user/regist_success.jsp").forward(request, response);

        }
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User loginUser = userService.login(new User(null, username, password, null, null, null, null));
        if (loginUser != null) {
            System.out.println("登陆成功!");
            request.getSession().setAttribute("loginUser", loginUser);
            request.setAttribute("username", loginUser.getUsername());
            request.getRequestDispatcher("/pages/user/login_success.jsp").forward(request, response);
        } else {
            System.out.println("登陆失败,请重新登录!");
            request.setAttribute("msg", "用户名或密码错误！");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
        }
    }

    protected void uploadphoto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        String filename;
        //先判断上传的数据是否是多段数据，只有多段数据才是文件上传
        if (ServletFileUpload.isMultipartContent(request)) {
            //创建工厂实现类
            FileItemFactory fileItemFactory = new DiskFileItemFactory();
            //创建用于解析上传数据的工具类
            ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
            //解析上传的数据，得到每一个表单项FileItem
            try {
                List<FileItem> list = servletFileUpload.parseRequest(request);
                for (FileItem fileItem : list) {
                    userService.updatePhoto(fileItem.getName(), loginUser.getId());
                    fileItem.write(new File("F:\\javaweb\\mkfriend\\web\\static\\img\\" + loginUser.getUsername() + fileItem.getName()));
                    response.sendRedirect(request.getContextPath() + "/pages/operation/uploadphoto_success.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /*protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sub = request.getParameter("sub");
        if ("all".equals(sub)) {
            //显示全部会员
            List<User> users = userService.queryUsers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("/pages/operation/showAll.jsp").forward(request, response);
        } else if ("one".equals(sub)) {
            //根据查找显示一个
            User user = userService.queryUserByName(request.getParameter("searchName"));
        }

    }*/
//进行分页显示全部会员信息
    protected void page(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNo;
        if (request.getParameter("pageNo") != null) {
            pageNo = Integer.parseInt(request.getParameter("pageNo"));
        } else {
            pageNo = 1;
        }
        int pageSize = Page.PAGE_SIZE;
        Page<User> page = userService.page(pageNo, pageSize);
        page.setUrl("userServlet?action=page");

        request.setAttribute("page", page);
        //4.请求转发到pages/manager/book_manager.jsp页面
        request.getRequestDispatcher("/pages/operation/showAll.jsp").forward(request, response);
    }

    protected void queryOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("searchName");
        User user = userService.queryUserByName(searchName);
        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("/pages/operation/showone.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "不存在该用户!");
            request.getRequestDispatcher("/pages/operation/showone.jsp").forward(request, response);

        }
    }

    protected void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");
        User user = userService.login(new User(null, loginUser.getUsername(), password, null, null, null, null));
        if (user != null) {
            request.setAttribute("oldPsd", password);
            request.setAttribute("newPsd", newPassword);
            userService.updatePassword(newPassword, loginUser.getId());
            request.getRequestDispatcher("/pages/operation/changePassword_success.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "旧密码错误,请重新输入");
            request.getRequestDispatcher("/pages/operation/changePassword.jsp").forward(request, response);
        }

    }

    protected void updateMess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPhone = request.getParameter("newPhone");
        String newEmail = request.getParameter("newEmail");
        String newMessage = request.getParameter("newMessage");
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        userService.updateMessage(newPhone,newEmail,newMessage,loginUser.getId());
        request.setAttribute("newPhone",newPhone);
        request.setAttribute("newEmail",newEmail);
        request.setAttribute("newMess",newMessage);
        request.getRequestDispatcher("/pages/operation/updateMess_success.jsp").forward(request,response);
    }
}