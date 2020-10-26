<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/table.css">
    <title>orders</title>
</head>
<body>
<div class="container">
    <h1 class="title">List of orders</h1>
    <div class="detail">
        <c:url var="orderLink" value="/update-customer">
            <c:param name="customerId" value="${customer.id}" />
        </c:url>
        <c:url var="customerLink" value="/customer/delete">
            <c:param name="customerId" value="${customer.id}" />
        </c:url>
        <h3>First Name: <span>${customer.firstName}</span></h3>
        <h3>Last Name: <span>${customer.lastName}</span></h3>
        <h3>Gender: <span>${customer.gender}</span></h3>
        <div class="actions">
            <a href="${orderLink}">update</a>
            <a href="${customerLink}">delete</a>
        </div>
    </div>
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
            <c:url var="deleteLink" value="/delete-order">
                <c:param name="orderId" value="${order.id}" />
            </c:url>
            <tr>
                <td>${order.productName}</td>
                <td>${order.quantity}</td>
                <td><a href="${updateLink}">update</a><a href="${deleteLink}">delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a class="add-btn" href="${pageContext.request.contextPath}/add-order">Add Order</a>
</div>
</body>
</html>

