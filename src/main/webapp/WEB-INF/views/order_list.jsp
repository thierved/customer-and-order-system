<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <title>orders</title>
</head>
<body>
<div class="container">
    <h1>List of orders</h1>
    <a href="${pageContext.request.contextPath}/add-order">Add Order</a>
    <table>
        <thead>
        <tr>
            <th>Product Name</th><th>Quantity</th><th>Update/Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.productName}</td>
                <td>${order.quantity}</td>
                <td><a href="">Update</a>/<a href="">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

