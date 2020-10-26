<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <title>Add Order</title>
</head>
<body>
    <div class="form-container container">
        <h1 class="title">Add Order</h1>
        <form:form modelAttribute="order" action="${pageContext.request.contextPath}/saveOrder" method="post">
            <div class="input-el">
                <label for="product-name">Product Name</label>
                <form:input path="productName" id="product-name"/>
            </div>
            <div class="input-el">
                <label for="quantity">Quantity</label>
                <form:input path="quantity" id="quantity" />
            </div>
            <input type="submit" value="Add Order">
        </form:form>
    </div>
</body>
</html>
