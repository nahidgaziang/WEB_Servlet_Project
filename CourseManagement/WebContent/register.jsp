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
                body {
                    background-color: #f5f7fa;
                }

                .signup-container {
                    max-width: 480px;
                    margin-top: 60px;
                    margin-bottom: 40px;
                }

                .signup-card {
                    border-radius: 12px;
                    border: none;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
                }

                .signup-header {
                    background-color: #fff;
                    border-bottom: 1px solid #e9ecef;
                    padding: 2rem 2rem 1.5rem 2rem;
                    border-radius: 12px 12px 0 0;
                    text-align: center;
                }

                .signup-header i {
                    font-size: 2.5rem;
                    color: #198754;
                    margin-bottom: 0.5rem;
                }

                .signup-header h4 {
                    color: #212529;
                    font-weight: 600;
                    margin-bottom: 0.25rem;
                }

                .signup-header p {
                    color: #6c757d;
                    font-size: 0.9rem;
                    margin: 0;
                }

                .signup-body {
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
                    border-color: #198754;
                    box-shadow: 0 0 0 0.15rem rgba(25, 135, 84, 0.15);
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

                .btn-signup {
                    border-radius: 8px;
                    padding: 0.65rem;
                    font-weight: 500;
                }

                .alert {
                    border-radius: 8px;
                }

                .login-link {
                    text-align: center;
                    margin-top: 1.5rem;
                    padding-top: 1.5rem;
                    border-top: 1px solid #e9ecef;
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