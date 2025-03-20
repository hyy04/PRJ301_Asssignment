/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.Application;
import model.User;
import dao.ApplicationDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class StatisticController extends HttpServlet {

    private UserDAO userDAO;
    private ApplicationDAO applicationDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        applicationDAO = new ApplicationDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Statistic</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Statistic at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userDAO.getAllUser();
        List<Application> applications = applicationDAO.getAllApplication();

        LocalDate today = LocalDate.now();
        int month = request.getParameter("month") != null ? Integer.parseInt(request.getParameter("month")) : today.getMonthValue();
        int year = request.getParameter("year") != null ? Integer.parseInt(request.getParameter("year")) : today.getYear();
        int daysInMonth = YearMonth.of(year, month).lengthOfMonth();

        Map<Integer, Set<Integer>> absent = new HashMap<>();

        for (User user : users) {
            absent.put(user.getUserId(), new HashSet<>());
        }

        for (Application application : applications) {

            if (application.getStatusId() != 2) {
                continue;
            }
            int userId = application.getUserId();
            LocalDate start = ((java.sql.Date) application.getStartDate()).toLocalDate();
            LocalDate end = ((java.sql.Date) application.getEndDate()).toLocalDate();

            for (LocalDate date = start; !date.isAfter(end); date = date.plusDays(1)) {
                if (date.getMonthValue() == month && date.getYear() == year) {
                    absent.get(userId).add(date.getDayOfMonth());
                }
            }
        }

        request.setAttribute("users", users);
        request.setAttribute("userAbsentDays", absent);
        request.setAttribute("month", month);
        request.setAttribute("year", year);
        request.setAttribute("daysInMonth", daysInMonth);

        request.getRequestDispatcher("application_statistic.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public boolean isAbsent(int userId, int day, int month, int year, List<Application> applications) {
        LocalDate targetDate = LocalDate.of(year, month, day);
        for (Application application : applications) {
            if (application.getStatusId() != 2) {
                continue;
            }
            LocalDate start = application.getStartDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate end = application.getEndDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            if (application.getUserId() == userId && !start.isAfter(targetDate) && !end.isBefore(targetDate)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
