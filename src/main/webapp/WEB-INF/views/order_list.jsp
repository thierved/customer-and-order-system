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
    <table>
        <thead>
        <tr>
            <th>First Name</th><th>Last Name</th><th>Gender</th><th>Update/Delete</th>
        </tr>
        </thead>
        <tbody>
            <c:url var="orderLink" value="/update-customer">
                <c:param name="customerId" value="${customer.id}" />
            </c:url>
            <c:url var="customerLink" value="/customer/delete">
                <c:param name="customerId" value="${customer.id}" />
            </c:url>
            <tr>
                <td>${customer.firstName}</td>
                <td>${customer.lastName}</td>
                <td>${customer.gender}</td>
                <td><a href="${orderLink}">
                    Update</a>/<a href="${customerLink}">Delete</a>
                </td>
            </tr>
        </tbody>
    </table>
    <table>
        <thead>
        <tr>
            <th>Product Name</th><th>Quantity</th><th>Update/Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <c:url var="updateLink" value="/update-order">
                <c:param name="orderId" value="${order.id}" />
            </c:url>
            <c:url var="deleteLink" value="/delete">
                <c:param name="orderId" value="${order.id}" />
            </c:url>
            <tr>
                <td>${order.productName}</td>
                <td>${order.quantity}</td>
                <td><a href="${updateLink}">Update</a>/<a href="${deleteLink}">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/add-order">Add Order</a>
</div>
</body>
</html>

