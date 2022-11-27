package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import sample.product.ProductError;
import sample.user.UserDTO;

public final class createProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head >\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>User Page</title>\n");
      out.write("        <link rel=\"icon\" type=\"image/x-icon\" href=\"assets/admin.ico\" />\n");
      out.write("    </head>\n");
      out.write("    <body style=\"background-image:url(image/backc.jpg)\">\n");
      out.write("        ");

            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            ProductError producterror = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (producterror == null) {
                producterror = new ProductError();
            }
        
      out.write("\n");
      out.write("\n");
      out.write("        <section>\n");
      out.write("            <form action=\"MainController\" method=\"POST\">\n");
      out.write("                <div class=\"formmer\">\n");
      out.write("                    <h1>Create Product</h1>\n");
      out.write("                    <hr>\n");
      out.write("                    <label for=\"productID\"><b>ProductID</b></label>\n");
      out.write("                    <input type=\"text\" name=\"productID\"  placeholder=\"Product ID\"/>");
      out.print( producterror.getProductID());
      out.write("\n");
      out.write("                    <label for=\"name\"><i class='bx bxs-pencil'></i><b>Name</b></label>\n");
      out.write("                    <input type=\"text\" name=\"name\"  placeholder=\"Product Name\"/>");
      out.print( producterror.getName());
      out.write("\n");
      out.write("                    <label for=\"name\"><i class='bx bxs-pencil'></i><b>Price</b></label>\n");
      out.write("                    <input type=\"text\" name=\"price\"  placeholder=\"Product Price\"/>");
      out.print( producterror.getPrice());
      out.write("\n");
      out.write("                    <label for=\"email\"><i class='bx bxs-pencil'></i><b>Quantity</b></label>\n");
      out.write("                    <input type=\"text\" name=\"quantity\"  placeholder=\"Product Quantity\"/>");
      out.print( producterror.getQuantity());
      out.write("\n");
      out.write("                    <label for=\"email\"><i class='bx bxs-pencil'></i><b>Image</b></label>\n");
      out.write("                    <input type=\"text\" name=\"image\"  placeholder=\"Product Image\"/>");
      out.print( producterror.getImage());
      out.write("\n");
      out.write("                    <label for=\"name\"><i class='bx bxs-pencil'></i><b>CategoryID</b></label>\n");
      out.write("                    <select name=\"categoryID\" placeholder=\"Product CategoryID\" >\n");
      out.write("                        <option value=\"A\">");
      out.print( producterror.getCategoryID());
      out.write("\n");
      out.write("                        </option>\n");
      out.write("                        <option value=\"B\">");
      out.print( producterror.getCategoryID());
      out.write("\n");
      out.write("                        </option>\n");
      out.write("                        <option value=\"C\">");
      out.print( producterror.getCategoryID());
      out.write("\n");
      out.write("                        </option>\n");
      out.write("                    </select>\n");
      out.write("                    <div class=\"form-group form-button\">\n");
      out.write("                        <hr>\n");
      out.write("                        <input type=\"submit\" name=\"action\"  class=\"registerbtn\" value=\"Create\"/>");
      out.print( producterror.getError());
      out.write("\n");
      out.write("                    </div>\n");
      out.write("            </form>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            * {box-sizing: border-box}\n");
      out.write("\n");
      out.write("            /* Add padding to containers */\n");
      out.write("            .formmer {\n");
      out.write("                padding: 16px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Full-width input fields */\n");
      out.write("            input[type=text], input[type=password] {\n");
      out.write("                width: 100%;\n");
      out.write("                padding: 15px;\n");
      out.write("                margin: 5px 0 22px 0;\n");
      out.write("                display: inline-block;\n");
      out.write("                border: none;\n");
      out.write("                background: #f1f1f1;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=text]:focus, input[type=password]:focus {\n");
      out.write("                background-color: #ddd;\n");
      out.write("                outline: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Overwrite default styles of hr */\n");
      out.write("            hr {\n");
      out.write("                border: 1px solid #f1f1f1;\n");
      out.write("                margin-bottom: 25px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Set a style for the submit/register button */\n");
      out.write("            .registerbtn {\n");
      out.write("                background-color: #04AA6D;\n");
      out.write("                color: white;\n");
      out.write("                padding: 16px 20px;\n");
      out.write("                margin: 8px 0;\n");
      out.write("                border: none;\n");
      out.write("                cursor: pointer;\n");
      out.write("                width: 100%;\n");
      out.write("                opacity: 0.9;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .registerbtn:hover {\n");
      out.write("                opacity:1;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Add a blue text color to links */\n");
      out.write("            a {\n");
      out.write("                color: dodgerblue;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Set a grey background color and center the text of the \"sign in\" section */\n");
      out.write("            .signin {\n");
      out.write("                background-color: #f1f1f1;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
