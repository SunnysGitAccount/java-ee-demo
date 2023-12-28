<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>JSP - Login Page</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/Login-Form-Basic-icons.css"/>
    <link rel="stylesheet" href="assets/css/styles.css"/>
</head>
<c:set var="errorMsg" value="${null}"/>
<c:set var="displayForm" value="${true}"/>

<%-- Using JSTL instead of Scriplets (See comments for older implementation) --%>
<%--<%if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null) { %>--%>
<c:if test="${\"POST\".equalsIgnoreCase(pageContext.request.method)
    && pageContext.request.getParameter(\"submit\") != null}">
    <jsp:useBean id="loginBean" class="dev.sunny.javaeedemo.LoginBean">
        <jsp:setProperty name="loginBean" property="*"/>
    </jsp:useBean>
    <c:choose>
        <c:when test="${!loginBean.validUser}">
            <c:set var="errorMsg" value="Invalid user id or password! Please try again."/>
        </c:when>
        <c:otherwise>
            <h4><c:out value="Welcome ${loginBean.userName}!"/></h4>
            <c:out value="You are successfully logged in."/>
            <c:set var="displayForm" value="${false}"/>
        </c:otherwise>
    </c:choose>
</c:if>

<%--<%--%>
<%--if (loginBean.isValidUser()) {--%>
<%--    out.println("<h2>Welcome " + loginBean.getUserName() + ".</h2>");--%>
<%--    out.println("You are successfully logged in!");--%>
<%--    return;--%>
<%--} else {--%>
<%--    errorMsg = "Invalid user id or password! Please try again.";--%>
<%--}--%>
<%--%>--%>

<%--<%} %>--%>
<c:if test="${displayForm}">
    <body>
    <section class="position-relative py-4 py-xl-5">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <h1>LOG IN</h1>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-xl-4">
                    <div class="card mb-5">
                        <div class="card-body d-flex flex-column align-items-center">
                            <div class="bs-icon-xl bs-icon-circle bs-icon-primary bs-icon my-4">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor"
                                     viewBox="0 0 16 16" class="bi bi-person">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"></path>
                                </svg>
                            </div>
                                <%--    <%}%>--%>
                            <form class="text-center w-100" method="post">
                                <div class="mb-3">
                                    <input class="form-control" type="text" name="userName"
                                           placeholder="User Name"/>
                                </div>
                                <div class="mb-3">
                                    <input class="form-control" type="password" name="password"
                                               placeholder="Password"/>
                                </div>
<%--                                <%if (errorMessage != null) {%>--%>
                                <c:if test="${errorMsg != null}">
                                    <div class="mb-3">
                                        <span class="alert alert-danger">
                                        <c:out value="${errorMsg}"/>
                                        </span>
                                    </div>
                                </c:if>
                                <div class="mb-3">
                                    <button class="btn btn-primary w-100" type="submit"
                                            name="submit">Login</button>
                                </div>
                                <p class="text-muted">Forgot your password?</p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"/>
    </body>
</c:if>
</html>
