/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import model.Application;
import model.Role;
import model.Status;
import model.User;
import dao.ApplicationDAO;
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
public class ApplicationManagementController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserApplicationManagementServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserApplicationManagementServlet at " + request.getContextPath () + "</h1>");
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
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }
        User user = (User) session.getAttribute("user");
        List<Application> applicationList = applicationDAO.getAllApplication();
        List<Status> statusList = statusDAO.getAllStatus();
        List<Status> statusListAppAndReject = statusDAO.getStatusApporedAndReject();
        List<User> userList = userDAO.getAllUser();
        List<Role> roleList = roleDAO.getAllRole();

        request.setAttribute("applicationList", applicationList);
        request.setAttribute("user", user);
        request.setAttribute("statusList", statusList);
        request.setAttribute("statusListAppAndReject", statusListAppAndReject);
        request.setAttribute("userList", userList);
        request.setAttribute("roleList", roleList);
        request.getRequestDispatcher("application_management.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO userDAO = new UserDAO();
        ApplicationDAO applicationDAO = new ApplicationDAO();

         if (action.equalsIgnoreCase("edit")) {
            int applicationId = Integer.parseInt(request.getParameter("applicationId"));
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            String title = request.getParameter("title");
            String reason = request.getParameter("reason");
            int statusId = Integer.parseInt(request.getParameter("statusId"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            int approverId = Integer.parseInt(request.getParameter("approverId"));

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

            Application a = new Application(applicationId,userId , startDate, endDate, title, reason, statusId, approverId);
            applicationDAO.approveApplication(a);
        }
        response.sendRedirect("userApplicationManagement");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
