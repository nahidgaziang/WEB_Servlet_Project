package servlet;

import dao.EnrollmentDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/student/registerCourse")
public class StudentRegisterServlet extends HttpServlet {
    private EnrollmentDAO dao = new EnrollmentDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession(false);
        if (s == null) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }
        User u = (User) s.getAttribute("user");
        if (u == null || !"student".equals(u.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        dao.enroll(u.getId(), courseId);
        resp.sendRedirect(req.getContextPath() + "/student/registered.jsp");
    }
}
