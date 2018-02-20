<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page session="false" %>

<html>
<head>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
    <title>Информация о книге</title>
    <link rel="stylesheet" href="/w3.css">
    <style type="text/css">
        a:link {
            text-decoration: none;
            text-decoration: underline;
        }

        a:hover {
            color: red;
        }

        .mainTable {
            width: 100%;
            max-width: 1600px;
        }

        td.myclass {
            vertical-align: middle;
        }

        td.myclass2 {
            text-align: center;
            vertical-align: middle;
        }
    </style>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
</head>
<body>
<div class="w3-container mainTable">
    <br/>
    <a href="<c:url value="/"/>">Главная</a> | <a href="<c:url value="/create"/>">Добавить книгу</a> | <a
        href="<c:url value="/update/${book.id}"/>">Обновить книгу</a>
    <br/>
    <br/>
    <h2>Информация о книге</h2>
    <table class="w3-table w3-border w3-striped w3-small">
        <tr class="w3-grey">
            <th class="w3-center">id</th>
            <th class="w3-center">Название</th>
            <th class="w3-center">Описание</th>
            <th class="w3-center">Автор</th>
            <th class="w3-center">ISBN</th>
            <th class="w3-center">Год</th>
            <th class="w3-center">Читал</th>
        </tr>
        <tr>
            <td class="myclass">${book.id}</td>
            <td class="myclass" width="200">${book.title}</td>
            <td class="myclass">${book.description}</td>
            <td class="myclass" width="110">${book.author}</td>
            <td class="myclass" width="142">${book.isbn}</td>
            <td class="myclass">${book.printYear}</td>
            <c:if test="${book.readAlready == false}">
                <td class="myclass2">Нет</td>
            </c:if>
            <c:if test="${book.readAlready == true}">
                <td class="myclass2">Да</td>
            </c:if>
        </tr>
    </table>
</div>
<c:if test="${book.readAlready == false}">
    <div class="w3-container">
        <br/>
        <c:url var="addAction" value="/add"/>
        <form:form action="${addAction}" modelAttribute="book">
            <form:hidden path="id"/>
            <form:hidden path="author"/>
            <form:hidden path="title"/>
            <form:hidden path="description"/>
            <form:hidden path="isbn"/>
            <form:hidden path="printYear"/>
            <form:hidden path="readAlready" value="true"/>
            <input type="submit" value="<spring:message text="Прочитано" />">
        </form:form>
    </div>
</c:if>
</body>
</html>