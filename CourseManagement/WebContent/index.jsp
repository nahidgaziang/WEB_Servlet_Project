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
          display: flex;
          align-items: center;
          justify-content: center;
          position: relative;
          overflow-x: hidden;
        }

        /* Animated background shapes */
        body::before,
        body::after {
          content: '';
          position: absolute;
          border-radius: 50%;
          background: linear-gradient(135deg, rgba(74, 144, 226, 0.1), rgba(80, 227, 194, 0.1));
          animation: float 20s infinite ease-in-out;
          z-index: 0;
        }

        body::before {
          width: 400px;
          height: 400px;
          top: -100px;
          left: -100px;
          animation-delay: 0s;
        }

        body::after {
          width: 300px;
          height: 300px;
          bottom: -80px;
          right: -80px;
          animation-delay: 4s;
        }

        @keyframes float {

          0%,
          100% {
            transform: translate(0, 0) scale(1);
          }

          33% {
            transform: translate(30px, -30px) scale(1.1);
          }

          66% {
            transform: translate(-20px, 20px) scale(0.9);
          }
        }

        .login-container {
          max-width: 440px;
          width: 100%;
          padding: 20px;
          position: relative;
          z-index: 1;
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

        .login-card {
          border-radius: 20px;
          border: none;
          background: #ffffff;
          box-shadow: 0 20px 60px rgba(0, 0, 0, 0.12),
            0 0 0 1px rgba(0, 0, 0, 0.05);
          overflow: hidden;
          transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .login-card:hover {
          box-shadow: 0 25px 70px rgba(0, 0, 0, 0.15),
            0 0 0 1px rgba(74, 144, 226, 0.1);
          transform: translateY(-2px);
        }

        .login-header {
          background: linear-gradient(135deg, #ffffff 0%, #f8f9ff 100%);
          border-bottom: 2px solid #f0f2f8;
          padding: 2.5rem 2rem 2rem;
          text-align: center;
          position: relative;
        }

        .login-header i {
          font-size: 3rem;
          background: linear-gradient(135deg, #4A90E2 0%, #50E3C2 100%);
          -webkit-background-clip: text;
          -webkit-text-fill-color: transparent;
          background-clip: text;
          margin-bottom: 0.8rem;
          display: inline-block;
          animation: iconPulse 3s infinite ease-in-out;
        }

        @keyframes iconPulse {

          0%,
          100% {
            transform: scale(1);
          }

          50% {
            transform: scale(1.05);
          }
        }

        .login-header h4 {
          color: #1a1f36;
          font-weight: 700;
          font-size: 1.6rem;
          margin-bottom: 0.4rem;
          letter-spacing: -0.5px;
        }

        .login-header p {
          color: #6b7280;
          font-size: 0.95rem;
          font-weight: 500;
          margin: 0;
        }

        .login-body {
          padding: 2.5rem 2rem;
          background: #ffffff;
        }

        .form-label {
          color: #374151;
          font-weight: 600;
          font-size: 0.875rem;
          margin-bottom: 0.5rem;
          display: block;
        }

        .input-group {
          position: relative;
          margin-bottom: 0;
        }

        .input-group-text {
          background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
          border: 2px solid #e5e7eb;
          border-right: none;
          border-radius: 12px 0 0 12px;
          color: #6b7280;
          padding: 0.75rem 1rem;
          transition: all 0.3s ease;
        }

        .input-group:focus-within .input-group-text {
          border-color: #4A90E2;
          background: linear-gradient(135deg, #f0f7ff 0%, #e6f2ff 100%);
          color: #4A90E2;
        }

        .form-control,
        .form-select {
          border: 2px solid #e5e7eb;
          border-left: none;
          border-radius: 0 12px 12px 0;
          padding: 0.75rem 1rem;
          font-size: 0.95rem;
          transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
          background: #ffffff;
        }

        .form-control:focus,
        .form-select:focus {
          border-color: #4A90E2;
          box-shadow: 0 0 0 4px rgba(74, 144, 226, 0.1);
          outline: none;
          background: #fafbff;
        }

        .form-control::placeholder {
          color: #9ca3af;
        }

        .btn-login {
          background: linear-gradient(135deg, #4A90E2 0%, #357ABD 100%);
          border: none;
          border-radius: 12px;
          padding: 0.85rem 1.5rem;
          font-weight: 600;
          font-size: 1rem;
          color: #ffffff;
          transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
          box-shadow: 0 4px 12px rgba(74, 144, 226, 0.3);
          position: relative;
          overflow: hidden;
        }

        .btn-login::before {
          content: '';
          position: absolute;
          top: 0;
          left: -100%;
          width: 100%;
          height: 100%;
          background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
          transition: left 0.5s;
        }

        .btn-login:hover::before {
          left: 100%;
        }

        .btn-login:hover {
          transform: translateY(-2px);
          box-shadow: 0 6px 20px rgba(74, 144, 226, 0.4);
          background: linear-gradient(135deg, #357ABD 0%, #2868A6 100%);
        }

        .btn-login:active {
          transform: translateY(0);
          box-shadow: 0 2px 8px rgba(74, 144, 226, 0.3);
        }

        .alert {
          border-radius: 12px;
          border: none;
          padding: 1rem 1.25rem;
          font-weight: 500;
          animation: slideIn 0.4s ease-out;
        }

        @keyframes slideIn {
          from {
            opacity: 0;
            transform: translateX(-20px);
          }

          to {
            opacity: 1;
            transform: translateX(0);
          }
        }

        .alert-danger {
          background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
          color: #b91c1c;
        }

        .alert-success {
          background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
          color: #065f46;
        }

        .signup-link {
          text-align: center;
          margin-top: 2rem;
          padding-top: 2rem;
          border-top: 2px solid #f0f2f8;
        }

        .signup-link a {
          color: #4A90E2;
          font-weight: 600;
          text-decoration: none;
          position: relative;
          transition: all 0.3s ease;
        }

        .signup-link a::after {
          content: '';
          position: absolute;
          bottom: -2px;
          left: 0;
          width: 0;
          height: 2px;
          background: linear-gradient(90deg, #4A90E2, #50E3C2);
          transition: width 0.3s ease;
        }

        .signup-link a:hover {
          color: #357ABD;
        }

        .signup-link a:hover::after {
          width: 100%;
        }

        /* Responsive */
        @media (max-width: 576px) {
          .login-container {
            margin-top: 20px;
          }

          .login-header {
            padding: 2rem 1.5rem 1.5rem;
          }

          .login-body {
            padding: 2rem 1.5rem;
          }
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