/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.Application;
import model.Department;
import model.Role;
import model.Status;
import model.User;
import dao.ApplicationDAO;
import dao.DepartmentDAO;
import dao.RoleDAO;
import dao.StatusDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ApplicationController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserApplicationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserApplicationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ApplicationDAO applicationDAO = new ApplicationDAO();
        StatusDAO statusDAO = new StatusDAO();
        UserDAO userDAO = new UserDAO();
        RoleDAO roleDAO = new RoleDAO();
        DepartmentDAO departmentDAO = new DepartmentDAO();
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }
        User user = (User) session.getAttribute("user");
        List<Department> departmentList = departmentDAO.getAllDepartment();
        List<Role> roleList = roleDAO.getAllRole();

        String action = request.getParameter("action");
        if (action != null && action.equalsIgnoreCase("add")) {
            request.setAttribute("departmentList", departmentList);
            request.setAttribute("roleList", roleList);
            request.setAttribute("user", user);
            request.getRequestDispatcher("application_add.jsp").forward(request, response);
            return;
        } else if (action != null && action.equalsIgnoreCase("delete")) {
            int applicationId = Integer.parseInt(request.getParameter("applicationId"));
            applicationDAO.deleteApplication(applicationId);
            response.sendRedirect("userApplication");
            return;
        }

        List<Application> applicationList = applicationDAO.getAllApplicationByUserId(user.getUserId());
        List<Status> statusList = statusDAO.getAllStatus();
        List<User> userList = userDAO.getAllUser();

        request.setAttribute("applicationList", applicationList);
        request.setAttribute("user", user);
        request.setAttribute("slist", statusList);
        request.setAttribute("ulist", userList);
        request.setAttribute("roleList", roleList);
        request.getRequestDispatcher("application.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ApplicationDAO applicationDAO = new ApplicationDAO();

        if (action.equalsIgnoreCase("addSave")) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            String title = request.getParameter("title");
            String reason = request.getParameter("reason");

            Date startDates = null;
            Date endDates = null;
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                startDates = sdf.parse(startDateStr);
                endDates = sdf.parse(endDateStr);
            } catch (Exception e) {
                e.printStackTrace();
            }
            java.sql.Date startDate = new java.sql.Date(startDates.getTime());
            java.sql.Date endDate = new java.sql.Date(endDates.getTime());

            Application application = new Application(0, userId, startDate, endDate, title, reason, 1, null);
            applicationDAO.addNewApplication(application);
        } else if (action.equalsIgnoreCase("edit")) {
            int applicationId = Integer.parseInt(request.getParameter("applicationId"));
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            String title = request.getParameter("title");
            String reason = request.getParameter("reason");

            Date startDates = null;
            Date endDates = null;
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                startDates = sdf.parse(startDateStr);
                endDates = sdf.parse(endDateStr);
            } catch (Exception e) {
                e.printStackTrace();
            }
            java.sql.Date startDate = new java.sql.Date(startDates.getTime());
            java.sql.Date endDate = new java.sql.Date(endDates.getTime());

            Application application = new Application(applicationId, 0, startDate, endDate, title, reason, 1, null);
            applicationDAO.updateApplication(application);
        }
        response.sendRedirect("userApplication");
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
