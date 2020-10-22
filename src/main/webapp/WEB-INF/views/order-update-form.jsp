<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="for" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Order</title>
</head>
<body>
    <div class="container">
        <h1>Update Order</h1>
        <form:form modelAttribute="order" action="${pageContext.request.contextPath}/update-order" method="post">
            <div class="input-el">
                <label>Product Name</label>
                <for:input path="productName"/>
            </div>
            <div class="input-el">
                <label>Quantity</label>
                <for:input path="quantity"/>
            </div>
            <input type="submit">            
        </form:form>
    </div>
</body>
</html>
