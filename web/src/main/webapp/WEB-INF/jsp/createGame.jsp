<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../static/common/jstl-connect.jsp" %>
<html lang="en">
    <head>
        <title>Charity Chess Games</title>
        <%@include file="../static/common/css-connect.jsp" %>
        <%@include file="../static/common/js-connect.jsp" %>
    </head>
    <body>
        <%@ include file="../static/common/header.jsp" %>
        <div style="text-align: center; font-size: 50px">
            The games you created
        </div>
        <div>
            <div class="container">
                <table class="table table-dark table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Game id</th>
                            <th scope="col">Game creation date</th>
                            <th scope="col">Game status</th>
                            <th scope="col">Result of the game</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="createdGame" items="${allCreatedGames}">
                            <tr>
                                <td>
                                    <a class="btn btn-dark" href="<c:url value="/viewParticipants?gameId=${createdGame.id}"/>"
                                       role="button">${createdGame.id}</a>
                                </td>
                                <td>${createdGame.gameStatus.date}</td>
                                <td>${createdGame.gameStatus.gameStatusName}</td>
                                <td><c:if test="${createdGame.isCreatorWin == true}">
                                        You win
                                    </c:if>
                                    <c:if test="${createdGame.isCreatorWin == false}">
                                        You lose
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div style="text-align: center; font-size: 30px">
            You can use other options
        </div>
        <div class="container">
            <div class="btn-group d-grid d-md-flex" role="group" aria-label="Basic example">
                <a class="btn btn-dark" href="<c:url value="/homePage"/>" role="button">Homepage</a>
                <a class="btn btn-dark" href="<c:url value="/viewAllCreatedGames"/>" role="button">View all created games</a>
                <a class="btn btn-dark" href="<c:url value="/viewAllAttachedGames"/>" role="button">View a list of all the games you’ve joined</a>
                <a class="btn btn-dark" href="<c:url value="/myGames"/>" role="button">View all games</a>
                <a class="btn btn-dark" href="<c:url value="/homePage"/>" role="button">See the history of games</a>
            </div>
        </div>
    </body>
</html>