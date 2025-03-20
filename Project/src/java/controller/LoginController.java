/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.User;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        Cookie cu = new Cookie("cookieUser", username);
        Cookie cp = new Cookie("cookiePass", password);
        Cookie cr = new Cookie("cookieRemember", remember);

        if (remember != null) {
            cu.setMaxAge(60 * 30); // 60 giây * 30 phút = 1800 giây
            cp.setMaxAge(60 * 30);
            cr.setMaxAge(60 * 30);
        } else {
            cu.setMaxAge(0);
            cp.setMaxAge(0);
            cr.setMaxAge(0);
        }
        response.addCookie(cu);
        response.addCookie(cp);
        response.addCookie(cr);
        UserDAO d = new UserDAO();
        try {
            User acc = d.getUserByUsernameAndPassword(username, password);
            if (acc == null) {
                request.setAttribute("ERROR", "Invalid password or username!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                session.setAttribute("user", acc);
                response.sendRedirect("userInfo");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
