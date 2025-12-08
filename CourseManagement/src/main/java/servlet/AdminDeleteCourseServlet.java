package servlet;

import dao.CourseDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Servlet for deleting courses (Admin only)
 */
@WebServlet("/admin/deleteCourse")
public class AdminDeleteCourseServlet extends HttpServlet {
    private CourseDAO dao = new CourseDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Verify admin session
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        try {
            int courseId = Integer.parseInt(req.getParameter("courseId"));
            dao.deleteCourse(courseId);
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard.jsp?success=Course+deleted");
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard.jsp?error=Invalid+course+ID");
        }
    }
}
