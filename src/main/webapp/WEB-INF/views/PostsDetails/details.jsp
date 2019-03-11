<%--
  Created by IntelliJ IDEA.
  User: ruben
  Date: 3/5/2019
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/" var="contextPath"/>


<head>
    <link rel="stylesheet" href="${contextPath}resources/css/cardHomeCSS.css">
    <link rel="icon" href="${contextPath}resources/images/Logo_zentry_BLACK.png">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <!--    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700|Raleway|Roboto+Slab:400,700"-->
    <!--          rel="stylesheet">-->
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
</head>

<tags:pageTemplate titulo="${post.title}">

    <div class="containerDIVS">
        <div class="headline">
            <h2 class="headline-title">News</h2>
            <a href="${contextPath}post/edit/${post.idPost}" class="headline-Button-edit">Edit</a>
            <form action="${contextPath}post/delete/${post.idPost}" method="POST">
                <button type="submit" class="headline-Button-delete">Delete</button>
            </form>
        </div>
        <div class="in-progress__cards">
            <div class="big-card in-progress__big-card">
                <h3 class="card-title">${post.title}</h3>
                <p class="card-text">${post.description}</p>
                <img src="${post.image}"
                     class="card-img" alt="Update Image">
                <time datetime="<fmt:formatDate pattern="MM/dd/yyyy - hh:mm a" value="${post.postDate}" />"
                      class="card-postdate"><fmt:formatDate pattern="MM/dd/yyyy - hh:mm a"
                                                            value="${post.postDate}"/></time>
            </div>
        </div>
    </div>

</tags:pageTemplate>
