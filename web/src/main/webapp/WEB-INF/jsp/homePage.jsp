<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../static/common/jstl-connect.jsp" %>
<html lang="en">
    <head>
        <title>Charity Chess Games</title>
        <%@include file="../static/common/css-connect.jsp" %>
        <%@include file="../static/common/js-connect.jsp" %>
    </head>
    <body>
    <c:if test="${sessionScope.user.role eq 'USER'}">
        <%@ include file="../static/common/header.jsp" %>
        <div style="text-align: center; font-size: 50px">
            Welcome to Charity Chess Games
        </div>
        <div class="container">
            <div class="card-group">
                <div class="card">
                    <img src="img/createGame.jpg" class="card-img-top" alt="create game">
                    <div class="card-body">
                        <h5 class="card-title">Create game</h5>
                        <p class="card-text">You can create a new game</p>
                        <form action="<c:url value="/createGame"/>" method="post">
                            <div class="input-group">
                                <input type="hidden" name="size" value="5" />
                                <input type="hidden" name="page" value="0" />
                                <input type="text" class="form-control" name="creationBet"
                                       placeholder="Your bet"
                                       aria-label="Dollar amount (with dot and two decimal places)">
                                <span class="input-group-text">$</span>
                                <button type="submit" class="btn btn-dark">Create</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card">
                    <img src="img/queen.png" class="card-img-top" alt="My games">
                    <div class="card-body">
                        <h5 class="card-title">My games</h5>
                        <p class="card-text">You can watch your games</p>
                        <form action="<c:url value="/myGames"/>">
                            <input type="hidden" name="pageFirstTable" value="0" />
                            <input type="hidden" name="sizeFirstTable" value="5" />
                            <input type="hidden" name="pageSecondTable" value="0" />
                            <button name="sizeSecondTable" value="5" type="submit"
                                    class="btn btn-dark">My games</button>
                        </form>
                    </div>
                </div>
                <div class="card">
                    <img src="img/horse.jfif" class="card-img-top" alt="Join the game">
                    <div class="card-body">
                        <h5 class="card-title">Join the game</h5>
                        <p class="card-text">You can join existing games</p>
                        <form action="<c:url value="/listAvailableGames"/>">
                            <input type="hidden" name="size" value="5" />
                            <button name="page" value="0"  type="submit"
                                    class="btn btn-dark">Join the game</button>
                        </form>
                    </div>
                </div>
                <div class="card">
                    <img src="img/pawn.jfif" class="card-img-top" alt="My Game Story">
                    <div class="card-body">
                        <h5 class="card-title">My Payments Story</h5>
                        <p class="card-text">You can see the payment history</p>
                        <form action="<c:url value="/userPayments"/>">
                            <input type="hidden" name="size" value="5" />
                            <button name="page" value="0"  type="submit"
                                    class="btn btn-dark">My Payments Story</button>
                        </form>
                    </div>
                </div>
                </div>
            <div class="text-center mt-4" style="color: red">
                <c:if test="${error != null}">
                    <c:out value="${error}"/>
                </c:if>
            </div>
        </div>
    </c:if>
    <c:if test="${sessionScope.user.role eq 'ADMIN'}">
        <%@ include file="../static/common/header.jsp" %>
        <div style="text-align: center; font-size: 50px">
            You can start processing the games
        </div>
        <div class="row row-cols-1 row-cols-4 g-5 justify-content-center">
            <div class="col">
                <div class="card">
                    <img src="img/referee.png" class="card-img-top" alt="create game">
                    <div class="card-body">
                        <h5 class="card-title">Start refereeing the games</h5>
                        <form action="<c:url value="/gamesAvailableForProcessing"/>">
                            <input type="hidden" name="size" value="5" />
                            <button name="page" value="0" type="submit"
                                    class="btn btn-dark">Start</button>
                        </form>
                    </div>
                </div>
                <div class="text-center mt-4" style="color: red">
                    <c:if test="${error != null}">
                        <c:out value="${error}"/>
                    </c:if>
                </div>
            </div>
        </div>
    </c:if>
    </body>
</html>
