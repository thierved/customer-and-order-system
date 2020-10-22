<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <title>Add Customer Form</title>
</head>
<body>
    <div class="form-container container">
        <h1>Add Customer</h1>
    <form:form action="${pageContext.request.contextPath}/customers" modelAttribute="customer" method="post">
        <div class="input-el">
            <label for="first-name">First Name</label>
            <input type="text" id="first-name" name="firstName" path="lastName">
        </div>

        <div class="input-el">
            <label for="last-name">First Name</label>
            <input type="text" id="last-name" name="lastName" path="lastName">
        </div>

        <div class="input-el">
            <label for="gender">Gender</label>
            <input type="text" id="gender" name="gender" path="firstName">
        </div>

        <input type="submit" value="Add Customer">
    </form:form>
    </div>
</body>
</html>
