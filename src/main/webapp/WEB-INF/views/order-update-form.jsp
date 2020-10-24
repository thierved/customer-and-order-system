<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <title>Update Order</title>
</head>
<body>
    <div class="container">
        <h1>Update Order</h1>
        <form:form action="${pageContext.request.contextPath}/update-order" method="post" modelAttribute="order">
            <form:hidden path="customer"/>
            <form:hidden path="id"/>
            <div class="input-el">
                <label>Product Name</label>
                <form:input path="productName"/>
            </div>
            <div class="input-el">
                <label>Quantity</label>
                <form:input path="quantity"/>
            </div>
            <input type="submit">            
        </form:form>
    </div>
</body>
</html>
