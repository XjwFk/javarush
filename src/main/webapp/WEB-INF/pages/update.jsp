<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page session="false" %>
<html>
<head>
    <title>Обновить книгу</title>
    <link rel="stylesheet" href="/w3.css">
    <style type="text/css">
        a:link {
            text-decoration: none;
            text-decoration: underline;
        }

        .mainTable {
            width: 450px;
        }

        a:hover {
            color: red;
        }
    </style>
</head>
<body>
<div class="w3-container mainTable">
    <br/>
    &nbsp;<a href="<c:url value="/"/>">Главная</a> | <a href="<c:url value="/create"/>">Добавить книгу</a>
    <br/>
    <br/>
    <c:if test="${!empty book.title}">
        <h2>Обновить книгу</h2>
    </c:if>

    <c:url var="addAction" value="/add"/>
    <form:form action="${addAction}" modelAttribute="book">
        <table class="w3-table">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="Id"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true"
                                cssStyle="background-color: lightgrey; color: gray; width:100%"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="author">
                        <spring:message text="Автор"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="author" readonly="true"
                                cssStyle="background-color: lightgrey; color: gray; width:100%"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="title">
                        <spring:message text="Название"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="title" cssStyle="width:100%"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="description">
                        <spring:message text="Описание"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="description" cssStyle="width:100%"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="isbn">
                        <spring:message text="ISBN"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="isbn" cssStyle="width:100%"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="printYear">
                        <spring:message text="Год"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="printYear" cssStyle="width:100%"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="<spring:message text="Обновить книгу" />">
                </td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>