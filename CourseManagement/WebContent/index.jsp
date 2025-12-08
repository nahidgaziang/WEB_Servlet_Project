<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!doctype html>
    <html>

    <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Course Management - Login</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
      <style>
        body {
          background-color: #f5f7fa;
        }

        .login-container {
          max-width: 420px;
          margin-top: 80px;
        }

        .login-card {
          border-radius: 12px;
          border: none;
          box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        }

        .login-header {
          background-color: #fff;
          border-bottom: 1px solid #e9ecef;
          padding: 2rem 2rem 1.5rem 2rem;
          border-radius: 12px 12px 0 0;
          text-align: center;
        }

        .login-header i {
          font-size: 2.5rem;
          color: #0d6efd;
          margin-bottom: 0.5rem;
        }

        .login-header h4 {
          color: #212529;
          font-weight: 600;
          margin-bottom: 0.25rem;
        }

        .login-header p {
          color: #6c757d;
          font-size: 0.9rem;
          margin: 0;
        }

        .login-body {
          padding: 2rem;
          background-color: #fff;
          border-radius: 0 0 12px 12px;
        }

        .form-control,
        .form-select {
          border-radius: 8px;
          padding: 0.65rem 1rem;
          border: 1px solid #dee2e6;
        }

        .form-control:focus,
        .form-select:focus {
          border-color: #0d6efd;
          box-shadow: 0 0 0 0.15rem rgba(13, 110, 253, 0.15);
        }

        .input-group-text {
          background-color: #f8f9fa;
          border: 1px solid #dee2e6;
          border-right: none;
          border-radius: 8px 0 0 8px;
          color: #6c757d;
        }

        .input-group .form-control,
        .input-group .form-select {
          border-left: none;
          border-radius: 0 8px 8px 0;
        }

        .btn-login {
          border-radius: 8px;
          padding: 0.65rem;
          font-weight: 500;
        }

        .alert {
          border-radius: 8px;
        }

        .signup-link {
          text-align: center;
          margin-top: 1.5rem;
          padding-top: 1.5rem;
          border-top: 1px solid #e9ecef;
        }
      </style>
    </head>

    <body>
      <div class="container login-container">
        <div class="card login-card">
          <div class="login-header">
            <i class="bi bi-mortarboard-fill"></i>
            <h4>Course Management</h4>
            <p>Sign in to your account</p>
          </div>
          <div class="login-body">
            <form action="login" method="post">
              <div class="mb-3">
                <label class="form-label small fw-medium">Username</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="bi bi-person"></i></span>
                  <input type="text" name="username" class="form-control" placeholder="Enter username" required
                    autofocus />
                </div>
              </div>

              <div class="mb-3">
                <label class="form-label small fw-medium">Password</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="bi bi-lock"></i></span>
                  <input type="password" name="password" class="form-control" placeholder="Enter password" required />
                </div>
              </div>

              <div class="mb-3">
                <label class="form-label small fw-medium">Login As</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="bi bi-person-badge"></i></span>
                  <select name="role" class="form-select" required>
                    <option value="">Select Role</option>
                    <option value="admin">Admin</option>
                    <option value="teacher">Teacher</option>
                    <option value="student">Student</option>
                  </select>
                </div>
              </div>

              <c:if test="${param.error != null}">
                <div class="alert alert-danger d-flex align-items-center mb-3">
                  <i class="bi bi-exclamation-triangle-fill me-2"></i>
                  <div>${param.error}</div>
                </div>
              </c:if>

              <c:if test="${param.success != null}">
                <div class="alert alert-success d-flex align-items-center mb-3">
                  <i class="bi bi-check-circle-fill me-2"></i>
                  <div>${param.success}</div>
                </div>
              </c:if>

              <button class="btn btn-primary btn-login w-100" type="submit">
                <i class="bi bi-box-arrow-in-right me-2"></i>Sign In
              </button>

              <div class="signup-link">
                <small class="text-muted">Don't have an account?
                  <a href="register.jsp" class="text-decoration-none fw-medium">Sign Up</a>
                </small>
              </div>
            </form>
          </div>
        </div>
      </div>
    </body>

    </html>