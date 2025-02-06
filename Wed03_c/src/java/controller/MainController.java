/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    public boolean isValidLogin(String username, String password) {
        return username.equals("admin") && password.equals("12345678");
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String User = request.getParameter("txtUsername");
        String Pass = request.getParameter("txtPassword");
        if (User.trim().length() == 0) {
            out.println("Please enter Uername!");
            return;
        }
        if (Pass.trim().length() == 0 || Pass.trim().length() < 8) {
            out.println("Password must be greate than 8 character!");
            return;
        }
        if (isValidLogin(User, Pass)) {
            // forward search.html
            RequestDispatcher rd = request.getRequestDispatcher("search.html");
            rd.forward(request, response);
        } else {
            // forward / redirect invalid.html
            // forward search.html
            // RequestDispatcher rd = request.getRequestDispatcher("invalid.html");
            // rd.forward(request, response); 

            // redirect search.html
            response.sendRedirect("invalid.html");

            //compare RequestDispatcher /  response.sendRedirect? khac biet? khi nao nen dung?
//            RequestDispatcher.forward(): Chuyển tiếp yêu cầu bên trong server mà không thay đổi URL và chia sẻ dữ liệu giữa các tài nguyên.
//            response.sendRedirect(): Chuyển hướng client, thay đổi URL trong thanh địa chỉ và tạo một yêu cầu HTTP mới.
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
