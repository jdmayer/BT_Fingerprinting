/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.12
 * Generated at: 2019-02-24 12:46:29 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"CSS/base.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"CSS/layout.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\r\n");
      out.write("\r\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\r\n");
      out.write("  <script src=\"http://code.jquery.com/jquery-3.3.1.js\" integrity=\"sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=\"\r\n");
      out.write("    crossorigin=\"anonymous\"></script>\r\n");
      out.write("\r\n");
      out.write("  <script>\r\n");
      out.write("    // source:\r\n");
      out.write("    // https://browserleaks.com/canvas#how-does-it-work\r\n");
      out.write("    // https://www.darkwavetech.com/index.php/device-fingerprint-blog/canvas-device-print\r\n");
      out.write("    function fingerprint_canvas() {\r\n");
      out.write("      \"use strict\"; // feature in EXMAScript 5 - prevents some actions + more exceptions     \r\n");
      out.write("\r\n");
      out.write("      var canvas = null;\r\n");
      out.write("      var canvasInput = null;\r\n");
      out.write("      var hash = null;\r\n");
      out.write("      var allSigns = \"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~1!2@3#4$5%6^7&8*9(0)-_=+[{]}|;:',<.>/?\";\r\n");
      out.write("\r\n");
      out.write("      try {\r\n");
      out.write("        // create canvas\r\n");
      out.write("        canvas = document.createElement('canvas');\r\n");
      out.write("        \r\n");
      out.write("        // fill canvas\r\n");
      out.write("        canvasInput = canvas.getContext('2d');\r\n");
      out.write("        canvasInput.textBaseline = \"top\";\r\n");
      out.write("        canvasInput.font = \"14px 'Arial'\";\r\n");
      out.write("        canvasInput.textBaseline = \"alphabetic\";\r\n");
      out.write("        canvasInput.fillStyle = \"#f60\";\r\n");
      out.write("        canvasInput.fillRect(125, 1, 62, 20);\r\n");
      out.write("        canvasInput.fillStyle = \"#069\";\r\n");
      out.write("        canvasInput.fillText(allSigns, 2, 15);\r\n");
      out.write("        canvasInput.fillStyle = \"rgba(102, 204, 0, 0.7)\";\r\n");
      out.write("        canvasInput.fillText(allSigns, 4, 17);\r\n");
      out.write("\r\n");
      out.write("        // create hash\r\n");
      out.write("        hash = canvas.toDataURL();\r\n");
      out.write("        console.log(hash);\r\n");
      out.write("\r\n");
      out.write("        // send hash to servlet\r\n");
      out.write("        $.ajax({\r\n");
      out.write("          type: 'POST',\r\n");
      out.write("          data: { hash: hash },\r\n");
      out.write("          url: 'Fingerprinting',\r\n");
      out.write("          success: function (result) {\r\n");
      out.write("            $('#result1').html(result);\r\n");
      out.write("          }\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        return hash;\r\n");
      out.write("      } catch (errorMsg) {\r\n");
      out.write("        //console.log(\"An error occured: \" + errorMsg)\r\n");
      out.write("        return \"An unexpected error occured\";\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  </script>\r\n");
      out.write("\r\n");
      out.write("  <title>Prototype</title>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("  <div id=\"header-content\" class=\"header-content\">\r\n");
      out.write("    <h3>Web Browser Fingerprinting Prototype</h3>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("  <div class=\"page-content\">\r\n");
      out.write("  \r\n");
      out.write("\t<div class=\"well\">\r\n");
      out.write("\tAdd here what fingerprinting is and that this prototype was created im rahmen of my Bachelorthesis and \r\n");
      out.write("\tthat it should show how canvas fingerprinting and browser fingerprinting.\r\n");
      out.write("\tAdd that each fingerprint creates own hash - not compatible as canvas gets bit from canvas and browser creates own.\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"panel panel-info\">\r\n");
      out.write("      <div class=\"panel-heading\">\r\n");
      out.write("        <a data-toggle=\"collapse\" href=\"#CanvasFP\">\r\n");
      out.write("          <h4 class=\"panel-title\">Canvas Fingerprinting</h4>\r\n");
      out.write("        </a>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div id=\"CanvasFP\" class=\"panel-collapse collapse collapse in\">\r\n");
      out.write("       <div class=\"panel-body\">Explanation etc.\r\n");
      out.write("          how does it work, what's its weakness\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"panel-footer\" id=\"result1\">\r\n");
      out.write("          <button type=\"button\" class=\"btn btn-info\" onclick=\"fingerprint_canvas();\">Check Canvas Fingerprint</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("    <div class=\"panel panel-info\">\r\n");
      out.write("      <div class=\"panel-heading\">\r\n");
      out.write("        <a data-toggle=\"collapse\" href=\"#BrowserFP\">\r\n");
      out.write("          <h4 class=\"panel-title\">Browser Fingerprinting</h4>\r\n");
      out.write("        </a>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div id=\"BrowserFP\" class=\"panel-collapse collapse collapse in\">\r\n");
      out.write("       <div class=\"panel-body\">Explanation etc.\r\n");
      out.write("          how does it work, what's its weakness\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"panel-footer\" id=\"result1\">\r\n");
      out.write("         <button type=\"button\" class=\"btn btn-info\" onclick=\"fingerprint_canvas();\">Check Browser Fingerprint</button>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"panel panel-info\">\r\n");
      out.write("      <div class=\"panel-heading\">\r\n");
      out.write("        <a data-toggle=\"collapse\" href=\"#Evaluation\">\r\n");
      out.write("          <h4 class=\"panel-title\">Evaluation</h4>\r\n");
      out.write("        </a>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div id=\"Evaluation\" class=\"panel-collapse collapse collapse in\">\r\n");
      out.write("        <div class=\"panel-body\">\r\n");
      out.write("        This prototype was tested on X devices and on Y different browser.\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"table-content\">\r\n");
      out.write("         <div class=\"row\" style=\"font-weight: bold;\">\r\n");
      out.write("\t\t    <div class=\"col-md-2\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-2\">Chrome</div>\r\n");
      out.write("\t\t    <div class=\"col-sm-2\">Mozilla Firefox</div>\r\n");
      out.write("\t\t    <div class=\"col-sm-2\">Opera</div>\r\n");
      out.write("\t\t    <div class=\"col-sm-2\">Microsoft Edge</div>\r\n");
      out.write("\t\t    <div class=\"col-sm-2\">Safari</div>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t  <div class=\"row\" style=\"background-color: #e5e5e0;\">\r\n");
      out.write("\t\t    <div class=\"col-md-2\" style=\"font-weight: bold;\">Windows</div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t  <div class=\"row\">\r\n");
      out.write("\t\t    <div class=\"col-md-2\" style=\"font-weight: bold;\">Mac OS</div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t  <div class=\"row\" style=\"background-color: #e5e5e0;\">\r\n");
      out.write("\t\t    <div class=\"col-md-2\" style=\"font-weight: bold;\">Linux</div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t    <div class=\"col-sm-1\"></div>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("<footer>\r\n");
      out.write("  <div class=footer>\r\n");
      out.write("    by Janine Denise Mayer\r\n");
      out.write("  </div>\r\n");
      out.write("</footer>\r\n");
      out.write("\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
