package servlet;

import dao.CourseDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/assignTeacher")
public class AssignTeacherServlet extends HttpServlet {
    private CourseDAO dao = new CourseDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String courseCode = req.getParameter("courseCode");
        String teacherIdStr = req.getParameter("teacherId");
        Integer teacherId = (teacherIdStr == null || teacherIdStr.isEmpty()) ? null : Integer.parseInt(teacherIdStr);

        boolean success = dao.assignTeacherByCode(courseCode, teacherId);
        if (success) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard.jsp?success=Teacher+assigned+successfully");
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard.jsp?error=Course+code+not+found");
        }
    }
}
