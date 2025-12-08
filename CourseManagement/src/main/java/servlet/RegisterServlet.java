package servlet;

import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Servlet for user registration
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDao = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String role = req.getParameter("role");
        String registrationNo = req.getParameter("registrationNo"); // For students

        // Validate input
        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                name == null || name.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                role == null || role.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/register.jsp?error=All+fields+are+required");
            return;
        }

        // Validate role (only teacher or student allowed)
        if (!"teacher".equals(role) && !"student".equals(role)) {
            resp.sendRedirect(req.getContextPath() + "/register.jsp?error=Invalid+role+selected");
            return;
        }

        // For students, registration number is required
        if ("student".equals(role) && (registrationNo == null || registrationNo.trim().isEmpty())) {
            resp.sendRedirect(
                    req.getContextPath() + "/register.jsp?error=Registration+number+is+required+for+students");
            return;
        }

        // Attempt registration
        boolean success = userDao.registerUser(username, password, name, email, role, registrationNo);

        if (success) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp?success=Registration+successful!+Please+login");
        } else {
            resp.sendRedirect(
                    req.getContextPath() + "/register.jsp?error=Username+or+registration+number+already+exists");
        }
    }
}
