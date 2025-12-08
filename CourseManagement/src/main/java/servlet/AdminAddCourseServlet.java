package servlet;

import dao.CourseDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/addCourse")
public class AdminAddCourseServlet extends HttpServlet {
    private CourseDAO dao = new CourseDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String desc = req.getParameter("description");
        String teacherIdStr = req.getParameter("teacherId");
        Integer teacherId = null;
        if (teacherIdStr != null && !teacherIdStr.isEmpty()) teacherId = Integer.parseInt(teacherIdStr);
        dao.addCourse(name, desc, teacherId);
        resp.sendRedirect(req.getContextPath() + "/admin/dashboard.jsp");
    }
}
