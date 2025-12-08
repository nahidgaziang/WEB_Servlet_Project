package servlet;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDao = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String selectedRole = req.getParameter("role");

        // Validate role selection
        if (selectedRole == null || selectedRole.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp?error=Please+select+a+role");
            return;
        }

        // Authenticate with specific role
        User u = userDao.authenticateWithRole(username, password, selectedRole);
        if (u == null) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp?error=Invalid+credentials+or+wrong+role");
            return;
        }

        HttpSession session = req.getSession();
        session.setAttribute("user", u);

        switch (u.getRole()) {
            case "admin":
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard.jsp");
                break;
            case "teacher":
                resp.sendRedirect(req.getContextPath() + "/teacher/courses.jsp");
                break;
            case "student":
                resp.sendRedirect(req.getContextPath() + "/student/courses.jsp");
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/index.jsp");
        }
    }
}
