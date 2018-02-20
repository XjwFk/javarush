<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>

<html>
<head>
    <title>Добавить книгу</title>
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
    <a href="<c:url value="/"/>">Главная</a>
    <br/>
    <br/>
    <h2>Добавить книгу</h2>

    <c:url var="addAction" value="/add"/>
    <form:form action="${addAction}" modelAttribute="book">
        <table class="w3-table">
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
                    <form:label path="author">
                        <spring:message text="Автор"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="author" cssStyle="width:100%"/>
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
                    <form:label path="PrintYear">
                        <spring:message text="Год"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="printYear" cssStyle="width:100%"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="<spring:message text="Добавить книгу" />">
                </td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>