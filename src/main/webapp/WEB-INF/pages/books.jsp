<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="false" %>

<html>
<head>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
    <title>Книги</title>
    <link rel="stylesheet" href="/w3.css">
    <style type="text/css">
        a:link {
            text-decoration: none;
            text-decoration: underline;
        }

        a:hover {
            color: red;
        }

        .current {
            font-size: 10pt;
            background-color: #404e80;
            text-align: center;
            color: aliceblue;
        }

        a.current {
            color: aliceblue;

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
</head>

<body>
<div class="w3-container mainTable">
    <br/>
    <a href="<c:url value="/"/>">Главная</a> | <a href="<c:url value="/create"/>">Добавить книгу</a>
    <br/>
    <br/>
    <form action="<c:url value="/search"/>" method="post">
        <p>Название:&nbsp;
            <input type="text" name="searchString" value="${search.searchString}" placeholder="название"/>
            <input type="submit" name="search" id="1" value="Найти"/>
            <a href="<c:url value="/books/1"/>"><input type="button" name="clear" id="2" value="Сбросить фильтр"/></a>
        </p>
    </form>
    <br/>
    <c:if test="${booksCount == 0}">
        <br/>
        <p>Книг нет.</p>
        <br/>
    </c:if>
    <c:if test="${!empty listBooks}">
        <table class="w3-table w3-border w3-striped w3-small" valign="top">
            <tr class="w3-grey">
                <th class="w3-center">id</th>
                <th class="w3-center">Название</th>
                <th class="w3-center">Описание</th>
                <th class="w3-center">Автор</th>
                <th class="w3-center">ISBN</th>
                <th class="w3-center">Год</th>
                <th class="w3-center">Читал</th>
                <th colspan="2"></th>
            </tr>
            <c:forEach items="${listBooks}" var="books">
                <tr>
                    <td class="myclass">${books.id}</td>
                    <td class="myclass" width="200"><a href="<c:url value="/info/${books.id}"/>">${books.title}</a></td>
                    <td class="myclass">${books.description}</td>
                    <td class="myclass" width="110">${books.author}</td>
                    <td class="myclass" width="142">${books.isbn}</td>
                    <td class="myclass">${books.printYear}</td>
                    <c:if test="${books.readAlready == false}">
                        <td class="myclass2">Нет</td>
                    </c:if>
                    <c:if test="${books.readAlready == true}">
                        <td class="myclass2">Да</td>
                    </c:if>
                    <td class="myclass"><a href="<c:url value="/update/${books.id}"/>">Обновить</a></td>
                    <td class="myclass"><a href="<c:url value="/delete/${books.id}"/>">Удалить</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <br/>
    <c:if test="${booksCount > 0}">
        <div class="w3-container">
            <table>
                <tr>
                    <td>Страницы:</td>
                    <c:forEach begin="${1}" end="${(booksCount/10) + (booksCount%10==0?0:1)}" var="i">
                        <td <c:if test="${page == i}"> class="current" </c:if>>
                            <a href="<c:url value="/books/${i}" />" <c:if
                                    test="${page == i}"> class="current" </c:if>> ${i} </a>
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </div>
    </c:if>
</div>
<br/>
<br/>
</body>
</html>
