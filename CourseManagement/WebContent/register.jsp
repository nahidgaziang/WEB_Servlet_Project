<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!doctype html>
        <html>

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Course Management - Sign Up</title>
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
                    padding: 40px 0;
                    position: relative;
                    overflow-x: hidden;
                }

                body::before,
                body::after {
                    content: '';
                    position: absolute;
                    border-radius: 50%;
                    background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(52, 211, 153, 0.1));
                    animation: float 20s infinite ease-in-out;
                    z-index: 0;
                }

                body::before {
                    width: 350px;
                    height: 350px;
                    top: -80px;
                    right: -80px;
                }

                body::after {
                    width: 380px;
                    height: 380px;
                    bottom: -100px;
                    left: -100px;
                    animation-delay: 5s;
                }

                @keyframes float {

                    0%,
                    100% {
                        transform: translate(0, 0) scale(1);
                    }

                    33% {
                        transform: translate(25px, -25px) scale(1.1);
                    }

                    66% {
                        transform: translate(-25px, 25px) scale(0.95);
                    }
                }

                .signup-container {
                    max-width: 500px;
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

                .signup-card {
                    border-radius: 20px;
                    border: none;
                    background: #ffffff;
                    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.12), 0 0 0 1px rgba(0, 0, 0, 0.05);
                    overflow: hidden;
                    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                }

                .signup-card:hover {
                    box-shadow: 0 25px 70px rgba(0, 0, 0, 0.15), 0 0 0 1px rgba(16, 185, 129, 0.1);
                    transform: translateY(-2px);
                }

                .signup-header {
                    background: linear-gradient(135deg, #ffffff 0%, #f0fdf4 100%);
                    border-bottom: 2px solid #f0f2f8;
                    padding: 2.5rem 2rem 2rem;
                    text-align: center;
                }

                .signup-header i {
                    font-size: 3rem;
                    background: linear-gradient(135deg, #10b981 0%, #34d399 100%);
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

                .signup-header h4 {
                    color: #1a1f36;
                    font-weight: 700;
                    font-size: 1.6rem;
                    margin-bottom: 0.4rem;
                    letter-spacing: -0.5px;
                }

                .signup-header p {
                    color: #6b7280;
                    font-size: 0.95rem;
                    font-weight: 500;
                    margin: 0;
                }

                .signup-body {
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
                    border-color: #10b981;
                    background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
                    color: #10b981;
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
                    border-color: #10b981;
                    box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1);
                    outline: none;
                    background: #f9fffe;
                }

                .form-control::placeholder {
                    color: #9ca3af;
                }

                .btn-signup {
                    background: linear-gradient(135deg, #10b981 0%, #059669 100%);
                    border: none;
                    border-radius: 12px;
                    padding: 0.85rem 1.5rem;
                    font-weight: 600;
                    font-size: 1rem;
                    color: #ffffff;
                    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                    box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
                    position: relative;
                    overflow: hidden;
                }

                .btn-signup::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: -100%;
                    width: 100%;
                    height: 100%;
                    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
                    transition: left 0.5s;
                }

                .btn-signup:hover::before {
                    left: 100%;
                }

                .btn-signup:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 6px 20px rgba(16, 185, 129, 0.4);
                    background: linear-gradient(135deg, #059669 0%, #047857 100%);
                }

                .btn-signup:active {
                    transform: translateY(0);
                    box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
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

                .login-link {
                    text-align: center;
                    margin-top: 2rem;
                    padding-top: 2rem;
                    border-top: 2px solid #f0f2f8;
                }

                .login-link a {
                    color: #10b981;
                    font-weight: 600;
                    text-decoration: none;
                    position: relative;
                    transition: all 0.3s ease;
                }

                .login-link a::after {
                    content: '';
                    position: absolute;
                    bottom: -2px;
                    left: 0;
                    width: 0;
                    height: 2px;
                    background: linear-gradient(90deg, #10b981, #34d399);
                    transition: width 0.3s ease;
                }

                .login-link a:hover {
                    color: #059669;
                }

                .login-link a:hover::after {
                    width: 100%;
                }

                @media (max-width: 576px) {
                    .signup-container {
                        padding: 20px 15px;
                    }

                    .signup-header {
                        padding: 2rem 1.5rem 1.5rem;
                    }

                    .signup-body {
                        padding: 2rem 1.5rem;
                    }
                }
            </style>
        </head>

        <body>
            <div class="container signup-container">
                <div class="card signup-card">
                    <div class="signup-header">
                        <i class="bi bi-person-plus-fill"></i>
                        <h4>Create Account</h4>
                        <p>Sign up for Course Management</p>
                    </div>
                    <div class="signup-body">
                        <form action="register" method="post">
                            <div class="mb-3">
                                <label class="form-label small fw-medium">Full Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                                    <input type="text" name="name" class="form-control"
                                        placeholder="Enter your full name" required autofocus />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-medium">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                    <input type="email" name="email" class="form-control" placeholder="Enter your email"
                                        required />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-medium">Username</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-at"></i></span>
                                    <input type="text" name="username" class="form-control"
                                        placeholder="Choose a username" required />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-medium">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                                    <input type="password" name="password" class="form-control"
                                        placeholder="Create a password" required />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-medium">Register As</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-person-badge-fill"></i></span>
                                    <select name="role" id="roleSelect" class="form-select" required
                                        onchange="toggleRegistrationNo()">
                                        <option value="">Select Your Role</option>
                                        <option value="teacher">Teacher</option>
                                        <option value="student">Student</option>
                                    </select>
                                </div>
                                <small class="text-muted ms-1">
                                    <i class="bi bi-info-circle"></i> Admin accounts cannot be created through
                                    registration
                                </small>
                            </div>

                            <div class="mb-3" id="registrationNoField" style="display: none;">
                                <label class="form-label small fw-medium">Registration Number</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-card-heading"></i></span>
                                    <input type="text" name="registrationNo" id="registrationNoInput"
                                        class="form-control"
                                        placeholder="Enter registration number (e.g., 2022331048)" />
                                </div>
                                <small class="text-muted ms-1">
                                    <i class="bi bi-info-circle"></i> Required for student registration
                                </small>
                            </div>

                            <script>
                                function toggleRegistrationNo() {
                                    var role = document.getElementById('roleSelect').value;
                                    var field = document.getElementById('registrationNoField');
                                    var input = document.getElementById('registrationNoInput');

                                    if (role === 'student') {
                                        field.style.display = 'block';
                                        input.setAttribute('required', 'required');
                                    } else {
                                        field.style.display = 'none';
                                        input.removeAttribute('required');
                                        input.value = '';
                                    }
                                }
                            </script>

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

                            <button class="btn btn-success btn-signup w-100" type="submit">
                                <i class="bi bi-person-plus me-2"></i>Create Account
                            </button>

                            <div class="login-link">
                                <small class="text-muted">Already have an account?
                                    <a href="index.jsp" class="text-decoration-none fw-medium">Sign In</a>
                                </small>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </body>

        </html>