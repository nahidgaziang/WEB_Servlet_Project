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
        HttpSession s = req.getSession(false);
        if (s == null) { resp.sendRedirect(req.getContextPath() + "/index.jsp"); return; }
        User u = (User) s.getAttribute("user");
        if (u == null || !"teacher".equals(u.getRole())) { resp.sendRedirect(req.getContextPath() + "/index.jsp"); return; }

        int courseId = Integer.parseInt(req.getParameter("courseId"));
        List<String> students = edao.getStudentsUsernamesByCourse(courseId);
        req.setAttribute("students", students);
        req.getRequestDispatcher("/teacher/students.jsp").forward(req, resp);
    }
}
