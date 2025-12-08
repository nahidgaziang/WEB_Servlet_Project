package servlet;

import dao.CourseDAO;
import model.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Servlet for updating courses (Admin only)
 */
@WebServlet("/admin/updateCourse")
public class AdminUpdateCourseServlet extends HttpServlet {
    private CourseDAO dao = new CourseDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // Verify admin session
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        try {
            int courseId = Integer.parseInt(req.getParameter("courseId"));
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            String teacherIdStr = req.getParameter("teacherId");

            Integer teacherId = null;
            if (teacherIdStr != null && !teacherIdStr.isEmpty()) {
                teacherId = Integer.parseInt(teacherIdStr);
            }

            dao.updateCourse(courseId, name, description, teacherId);
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard.jsp?success=Course+updated");
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard.jsp?error=Invalid+input");
        }
    }
}
