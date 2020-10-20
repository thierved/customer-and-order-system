<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/main.css">
    <title>Title</title>
</head>
<body>
    <div class="container">
        <h1>List of Customers</h1>
        <a href="${pageContext.request.contextPath}/add_customer">Add Customer</a>
        <table>
            <thead>
                <tr>
                    <th>First Name</th><th>Last Name</th><th>Gender</th><th>Update/Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customers}">
                    <c:url var="orderLink" value="/orders">
                        <c:param name="customerId" value="${customer.id}" />
                    </c:url>
                    <tr>
                        <td>${customer.firstName}</td>
                        <td>${customer.lastName}</td>
                        <td>${customer.gender}</td>
                        <td><a href="${orderLink}">
                            Update</a>/<a href="${orderLink}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
