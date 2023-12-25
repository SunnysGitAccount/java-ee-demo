package dev.sunny.javaeedemo.servlets;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    public LoginServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html");
        resp.getWriter().write(createForm(null));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");

//        Create StringBuilder to hold response string
        StringBuilder sb = new StringBuilder();
        if ("admin".equals(userName) && "admin".equalsIgnoreCase(password)) {
            sb.append("<h2>Welcome admin!</h2>")
                    .append("You are successfully logged in.");
        } else {
            sb.append(createForm("Invalid user id or password! Please try again."));
        }

        resp.setContentType("text/html");
        resp.getWriter().write(sb.toString());
    }

    protected String createForm(String errorMsg) {
        StringBuilder sb = new StringBuilder("<h2>LOGIN</h2>");

//        Check whether error message is to be displayed.
        if (errorMsg != null) {
            sb.append("<span style='color: red;'>")
                    .append(errorMsg)
                    .append("</span>");
        }

//        Create form
        sb.append("    <form method='post'>\n")
                .append("        <table>\n")
                .append("            <tr>\n")
                .append("                <td>\n")
                .append("                    <label>User Name</label>\n")
                .append("                </td>\n")
                .append("                <td>\n")
                .append("                    <label>\n")
                .append("                        <input type=\"text\" name=\"userName\">\n")
                .append("                    </label>\n")
                .append("                </td>\n")
                .append("            </tr>\n")
                .append("            <tr>\n")
                .append("                <td>\n")
                .append("                    <label>Password</label>\n")
                .append("                </td>\n")
                .append("                <td>\n")
                .append("                    <label>\n")
                .append("                        <input type=\"password\" name=\"password\">\n")
                .append("                    </label>\n")
                .append("                </td>\n")
                .append("            </tr>\n")
                .append("        </table>")
                .append("        <button type=\"submit\" name=\"submit\">SUBMIT</button>\n")
                .append("        <button type=\"reset\" name=\"reset\">RESET</button>\n")
                .append("    </form>\n");

        return sb.toString();
    }
}
