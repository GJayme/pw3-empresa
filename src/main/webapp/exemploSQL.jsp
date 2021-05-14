<%@ taglib prefix="sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>JSTL SQL</title>
</head>
<body>
    <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://127.0.0.1:3306/empresa"
                       user="root" password="root"/>

    <sql:update var="count" dataSource="${con}">
        insert into users(nome,email,cpf,username,password) values('Pedro', 'p@mail.com', 1111111111, 'pedrop', MD5('77777'));
    </sql:update>

    <sql:query var="result" dataSource="${con}">
        select * from users;
    </sql:query>

    <table border="1" width="100%">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>E-mail</th>
            <th>CPF</th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td><c:out value="${row.id}"/> </td>
                <td><c:out value="${row.nome}"/> </td>
                <td><c:out value="${row.email}"/> </td>
                <td><c:out value="${row.cpf}"/> </td>
            </tr>
        </c:forEach>
    </table>


</body>
</html>
