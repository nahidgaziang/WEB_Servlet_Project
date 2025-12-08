<%@ page import="dao.CourseDAO, java.util.List, model.Course" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page session="true" %>
      <% model.User user=(model.User) session.getAttribute("user"); if (user==null || !"teacher".equals(user.getRole()))
        { response.sendRedirect("../index.jsp"); return; } CourseDAO cdao=new CourseDAO(); List<Course> courses =
        cdao.getByTeacher(user.getId());
        request.setAttribute("courses", courses);
        %>
        <!doctype html>
        <html>

        <head>
          <meta charset="utf-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <title>Teacher - My Courses</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
          <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
          <style>
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

            * {
              margin: 0;
              padding: 0;
              box-sizing: border-box;
            }

            body {
              font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
              background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
              min-height: 100vh;
              padding: 2rem 0;
            }

            .container {
              background: #ffffff;
              border-radius: 20px;
              padding: 2.5rem;
              box-shadow: 0 20px 60px rgba(0, 0, 0, 0.12), 0 0 0 1px rgba(0, 0, 0, 0.05);
              max-width: 1100px;
              animation: slideUp 0.6s ease-out;
            }

            @keyframes slideUp {
              from {
                opacity: 0;
                transform: translateY(30px);
              }

              to {
                opacity: 1;
                transform: translateY(0);
              }
            }

            .page-header {
              display: flex;
              justify-content: space-between;
              align-items: center;
              margin-bottom: 2rem;
              padding-bottom: 1.5rem;
              border-bottom: 2px solid #f0f2f8;
            }

            .page-header h3 {
              color: #1a1f36;
              font-weight: 700;
              font-size: 1.8rem;
              margin: 0;
              display: flex;
              align-items: center;
              gap: 0.75rem;
            }

            .page-header h3 i {
              background: linear-gradient(135deg, #f59e0b 0%, #f97316 100%);
              -webkit-background-clip: text;
              -webkit-text-fill-color: transparent;
              background-clip: text;
            }

            .user-info {
              display: flex;
              align-items: center;
              gap: 1rem;
            }

            .user-name {
              color: #374151;
              font-weight: 600;
              font-size: 0.95rem;
            }

            .user-info a {
              color: #4A90E2;
              text-decoration: none;
              font-weight: 600;
              padding: 0.5rem 1rem;
              border-radius: 8px;
              transition: all 0.3s ease;
              background: linear-gradient(135deg, #f0f7ff 0%, #e6f2ff 100%);
            }

            .user-info a:hover {
              background: linear-gradient(135deg, #4A90E2 0%, #357ABD 100%);
              color: #ffffff;
              transform: translateY(-2px);
              box-shadow: 0 4px 12px rgba(74, 144, 226, 0.3);
            }

            .section-title {
              color: #1a1f36;
              font-weight: 700;
              font-size: 1.3rem;
              margin: 1.5rem 0 1rem;
              display: flex;
              align-items: center;
              gap: 0.5rem;
            }

            .section-title i {
              color: #f59e0b;
            }

            .table {
              background: #ffffff;
              border-radius: 12px;
              overflow: hidden;
              box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            }

            .table thead {
              background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
            }

            .table thead th {
              color: #92400e;
              font-weight: 700;
              text-transform: uppercase;
              font-size: 0.75rem;
              letter-spacing: 0.5px;
              padding: 1rem;
              border: none;
            }

            .table tbody td {
              padding: 1rem;
              vertical-align: middle;
              color: #4b5563;
              border-bottom: 1px solid #f3f4f6;
            }

            .table tbody tr:last-child td {
              border-bottom: none;
            }

            .table tbody tr:hover {
              background: linear-gradient(135deg, #fffbeb 0%, #fef3c7 50%);
            }

            .btn {
              border-radius: 10px;
              padding: 0.5rem 1.2rem;
              font-weight: 600;
              font-size: 0.9rem;
              transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
              border: none;
            }

            .btn-primary {
              background: linear-gradient(135deg, #f59e0b 0%, #f97316 100%);
              box-shadow: 0 4px 12px rgba(245, 158, 11, 0.3);
            }

            .btn-primary:hover {
              background: linear-gradient(135deg, #d97706 0%, #ea580c 100%);
              transform: translateY(-2px);
              box-shadow: 0 6px 20px rgba(245, 158, 11, 0.4);
            }

            @media (max-width: 768px) {
              .container {
                padding: 1.5rem;
              }

              .page-header {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
              }
            }
          </style>
        </head>

        <body>
          <div class="container">
            <div class="page-header">
              <h3><i class="bi bi-easel"></i> Teacher Portal</h3>
              <div class="user-info">
                <span class="user-name"><i class="bi bi-person-circle"></i>
                  <%= user.getName() %>
                </span>
                <a href="<%= request.getContextPath() %>/logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
              </div>
            </div>

            <h5 class="section-title"><i class="bi bi-journal-bookmark"></i> My Assigned Courses</h5>

            <table class="table">
              <thead>
                <tr>
                  <th>Code</th>
                  <th>Course Name</th>
                  <th>Description</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="c" items="${courses}">
                  <tr>
                    <td><strong>${c.courseCode}</strong></td>
                    <td>${c.name}</td>
                    <td>${c.description}</td>
                    <td>
                      <a href="students.jsp?courseId=${c.id}" class="btn btn-primary btn-sm">
                        <i class="bi bi-people"></i> View Students
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>

          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>