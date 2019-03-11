<%--
  Created by IntelliJ IDEA.
  User: ruben
  Date: 2/26/2019
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<%--<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>--%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:url value="/" var="contextPath" />

<header class="header headerDesktop">
    <div class="container">
        <div class="menu-all">
            <a href="${contextPath}"><img src="${contextPath}resources/images/Logo_zentry_BLACK.png" alt="Zentry Icon" class="header-logo"></a>
            <nav class="content-menu">
                <aside>
                    <ul class="header-menu">
                        <li><a href="${contextPath}" class="header-menu-item">Home</a></li>
                        <li><a href="#" class="header-menu-item">Games</a></li>
                        <li><a href="#" class="header-menu-item">Forum</a></li>
                        <li><a href="#" class="header-menu-item">Rules</a></li>
                        <li><a href="#" class="header-menu-item">Players</a></li>
                        <li><a href="#" class="header-menu-item-login">Log-in</a></li>
                    </ul>
                </aside>
            </nav>
        </div>
    </div>
</header>