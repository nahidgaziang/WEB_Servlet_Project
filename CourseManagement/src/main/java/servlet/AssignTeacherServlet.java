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
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        String teacherIdStr = req.getParameter("teacherId");
        Integer teacherId = (teacherIdStr == null || teacherIdStr.isEmpty()) ? null : Integer.parseInt(teacherIdStr);
        dao.assignTeacher(courseId, teacherId);
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard.jsp");
    }
}
