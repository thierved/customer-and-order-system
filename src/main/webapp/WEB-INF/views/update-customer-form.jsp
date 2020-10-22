<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <title>Update Customer</title>
</head>
<body>
<div class="form-container container">
    Update Customer!
    <form:form action="${pageContext.request.contextPath}/update-customer" modelAttribute="customer" method="post">
        <form:hidden path="id"/>
        <div class="input-el">
            <label>First Name</label>
            <form:input type="text" path="firstName" />
        </div>

        <div class="input-el">
            <label>First Name</label>
            <form:input type="text" path="lastName" />
        </div>

        <div class="input-el">
            <label>Gender</label>
            <form:input type="text" path="gender" />
        </div>

        <input type="submit" value="update Customer">
    </form:form>
</div>
</body>
</html>
