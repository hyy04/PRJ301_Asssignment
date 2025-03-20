/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.Department;
import model.Role;
import model.User;
import dao.DepartmentDAO;
import dao.RoleDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class UserInfoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserInfoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserInfoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login"); 
            return;
        }
        User u = (User) session.getAttribute("user");
        UserDAO userDAO = new UserDAO();
        DepartmentDAO departmentDAO = new DepartmentDAO();
        RoleDAO roleDAO = new RoleDAO();
        
        User user = userDAO.getUserById(u.getUserId());
        List<Department> departmantList = departmentDAO.getAllDepartment();
        List<Role> roleList = roleDAO.getAllRole();
        
        request.setAttribute("user", user);
        request.setAttribute("departmantList", departmantList);
        request.setAttribute("roleList", roleList);
        request.getRequestDispatcher("user_infomation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO userDAO = new UserDAO();
        if (action.equalsIgnoreCase("edit")) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int departmentId = Integer.parseInt(request.getParameter("departmentId"));
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            int status = Integer.parseInt(request.getParameter("status"));
            User userEdit = new User(userId, username, password, name, email, phone, departmentId, roleId, status);
            userDAO.updateProfile(userEdit);
        } 

        response.sendRedirect("userInfo");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
