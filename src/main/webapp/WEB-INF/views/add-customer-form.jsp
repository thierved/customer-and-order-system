<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add Customer Form</title>
</head>
<body>
    Add Customer!
    <form:form action="${pageContext.request.contextPath}/customers" modelAttribute="customer" method="post">
        <label for="first-name">First Name</label>
        <input type="text" id="first-name" name="firstName" path="lastName">
        <label for="last-name">First Name</label>
        <input type="text" id="last-name" name="lastName" path="lastName">
        <label for="gender">First Name</label>
        <input type="text" id="gender" name="gender" path="firstName">
        <input type="submit" value="Add Customer">
    </form:form>
</body>
</html>
