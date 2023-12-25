<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>JSP - Login Page</title>
</head>
<c:set var="errorMsg" value="${null}"/>
<c:set var="displayForm" value="${true}"/>

<%-- Using JSTL instead of Scriplets (See comments for older implementation) --%>
<%--<%if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null) { %>--%>
<c:if test="${\"POST\".equalsIgnoreCase(pageContext.request.method)
    && pageContext.request.getParameter(\"submit\") != null}">
    <jsp:useBean id="loginBean" class="dev.sunny.javaeedemo.LoginBean">
        <jsp:setProperty name="loginBean" property="*" />
    </jsp:useBean>
    <c:choose>
        <c:when test="${!loginBean.validUser}">
            <c:set var="errorMsg" value="Invalid user id or password! Please try again."/>
        </c:when>
        <c:otherwise>
            <h4><c:out value="Welcome ${loginBean.userName}!" /></h4>
            <c:out value="You are successfully logged in." />
            <c:set var="displayForm" value="${false}" />
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
    <h2>LOGIN</h2>
        <%--    <%if (errorMessage != null) {%>--%>
    <c:if test="${errorMsg != null}">
        <span style="color: red;">
            <c:out value="${errorMsg}"/>
        </span>
    </c:if>
        <%--    <%}%>--%>
    <form method="post">
        <table>
            <tr>
                <td>
                    <label>User Name</label>
                </td>
                <td>
                    <label>
                        <input type="text" name="userName">
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Password</label>
                </td>
                <td>
                    <label>
                        <input type="password" name="password">
                    </label>
                </td>
            </tr>
        </table>
        <button type="submit" name="submit">SUBMIT</button>
        <button type="reset" name="reset">RESET</button>
    </form>
    </body>
</c:if>
</html>