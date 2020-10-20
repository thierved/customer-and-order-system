<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Order</title>
</head>
<body>
    <div>
        <h1>Add Order</h1>
        <form:form modelAttribute="order" action="${pageContext.request.contextPath}/orders" method="post">
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
