/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.Product;
import sample.product.ProductDAO;
import sample.product.ProductError;

/**
 *
 * @author toanm
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "MainController?search=&action=Search";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String image = request.getParameter("image");
            String categoryID = request.getParameter("categoryID");
            ProductError producterror = new ProductError();
            boolean checkValidation = true;
            if (productID.length() > 10 || productID.length() < 2) {
                producterror.setProductID("ProductID must between [3-10]");
                checkValidation = false;
            }
            if (name.length() > 50 || name.length() < 5) {
                producterror.setName("ProductName must between [6-50]");
                checkValidation = false;
            }
            if (price < 0) {
                producterror.setPrice("Product Price must greater than 0$");
                checkValidation = false;
            }
            if (quantity < 0) {
                producterror.setQuantity("Product quantity must greater than 0");
                checkValidation = false;
            }
            if (image.length() < 0) {
                producterror.setImage("Please add image");
                checkValidation = false;
            }
            if (categoryID.length() < 0) {
                producterror.setCategoryID("Please add categoryID");
                checkValidation = false;
            }
            if (checkValidation) {
                ProductDAO dao = new ProductDAO();
                Product product = new Product(productID, name, price, quantity, image, categoryID);
                boolean checkDuplicate = dao.checkDuplicate(productID);
                if (checkDuplicate) {
                    producterror.setProductID("Duplicate ProductID");
                    request.setAttribute("PRODUCT_ERROR", producterror);
                } else {
                    boolean checkInsert = dao.insert(product);
                    if (checkInsert) {
                        url = SUCCESS;
                    } else {
                        producterror.setError("Error");
                        request.setAttribute("PRODUCT_ERROR", producterror);
                    }
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", producterror);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
