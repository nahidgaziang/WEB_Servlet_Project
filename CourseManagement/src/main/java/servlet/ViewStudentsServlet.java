package servlet;

import dao.EnrollmentDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/teacher/viewStudents")
public class ViewStudentsServlet extends HttpServlet {
    private EnrollmentDAO edao = new EnrollmentDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String courseIdStr = req.getParameter("courseId");
        if (courseIdStr == null || courseIdStr.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/teacher/courses.jsp");
            return;
        }

        int courseId = Integer.parseInt(courseIdStr);
        EnrollmentDAO edao = new EnrollmentDAO();
        List<String[]> students = edao.getStudentDetailsByCourse(courseId);
        req.setAttribute("students", students);

        req.getRequestDispatcher("/teacher/students.jsp").forward(req, resp);
    }
}
