<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>orders</title>
</head>
<body>
<div>
    <h1>List of orders</h1>
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

