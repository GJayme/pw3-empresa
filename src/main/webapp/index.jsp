<%--Aula de JSTL--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.empresa.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exemplo JSTL</title>
</head>
<body>
    <h1>Exemplo JSTL</h1>
    <c:set var="salario" scope="session" value="${2000*2}"/>

    <p>Valor do Salário <c:out value="${salario}"/> </p>

    <c:remove var="salario"/>

    <p>Valor do salario <c:out value="${salario}"/></p>

    <c:catch var="e">
        <% int x= 5/2; %>
    </c:catch>

    <c:if test="${e != null}">
        <c:out value="${e}"/>
        <c:out value="${e.message}"/>
    </c:if>

    <c:forEach var="1" begin="1" end="5">
        <p>Item <c:out value="${1}"/> </p>
    </c:forEach>

    <c:forTokens items="Banana,Laranja,Abacaxi,Tomate" delims="," var="frutas">
        <p><c:out value="${frutas}"/> </p>
    </c:forTokens>

    <h1>Formatação de números</h1>
    <c:set var="valor" value="120000.2309"/>
    <p>Número formatado (1): <fmt:formatNumber value="${valor}" type="currency"/> </p>
    <p>Número formatado (2): <fmt:formatNumber value="${valor}" type="number" maxIntegerDigits="3"/>  </p>
    <p>Número formatado (3): <fmt:formatNumber value="${valor}" type="number" maxFractionDigits="2"/> </p>
    <p>Número formatado (4): <fmt:formatNumber value="${valor}" type="number" groupingUsed="false"/> </p>
    <p>Número formatado (5): <fmt:formatNumber value="${valor}" type="number" groupingUsed="true"/> </p>
    <p>Número formatado (6): <fmt:formatNumber value="${valor}" type="percent" /> </p>
    <p>Número formatado (7): <fmt:formatNumber value="${valor}" type="percent" minFractionDigits="10"/> </p>
    <p>Número formatado (8): <fmt:formatNumber value="${valor}" type="number" pattern="###.###E0"/> </p>

    <p>Valor em Dólar:
        <fmt:setLocale value="en_US"/>
        <fmt:formatNumber value="${valor}" type="currency"/>
    </p>

    <h1>Formatação de Data</h1>
    <c:set var="now" value="<%=new java.util.Date()%>"/>
    <p>Data formatada (1): <fmt:formatDate value="${now}" type="time"/>  </p>
    <p>Data formatada (2): <fmt:formatDate value="${now}" type="date"/>  </p>
    <p>Data formatada (3): <fmt:formatDate value="${now}" type="both"/>  </p>
    <p>Data formatada (4): <fmt:formatDate value="${now}" type="both" timeStyle="short" dateStyle="short"/>  </p>
    <p>Data formatada (5): <fmt:formatDate value="${now}" type="both" timeStyle="medium" dateStyle="medium"/>  </p>
    <p>Data formatada (6): <fmt:formatDate value="${now}" type="both" timeStyle="long" dateStyle="long"/>  </p>
    <p>Data formatada (7): <fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>  </p>



</body>
</html>
