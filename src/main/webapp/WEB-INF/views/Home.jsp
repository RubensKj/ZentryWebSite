<%--
  Created by IntelliJ IDEA.
  User: ruben
  Date: 2/26/2019
  Time: 11:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/" var="contextPath"/>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/css/NavCSS.css">
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

<tags:pageTemplate titulo="Home">

    ${postSuccessful}
    ${postDeleted}
    ${postEdited}

    <div class="containerDIVS">
        <div class="headline">
            <h2 class="headline-title">News</h2>
            <a href="${contextPath}newpost" class="headline-Button">New Post</a>
        </div>
        <c:forEach items="${listPost }" var="post">
            <div class="in-progress__cards">
                <div class="big-card in-progress__big-card">
                                                    <%-- ${s:mvcUrl('NPC#details').arg(0, post.id).build()} --%>
                    <a class="big-card__course-link" href="${contextPath}post/${post.idPost}"></a>
                    <h3 class="card-title">${post.title}</h3>
                    <p class="card-text">${post.description}</p>
                    <img src="${post.image}"
                         class="card-img" alt="Update Image">
                    <time datetime="<fmt:formatDate pattern="MM/dd/yyyy - hh:mm a" value="${post.postDate}" />" class="card-postdate"><fmt:formatDate pattern="MM/dd/yyyy - hh:mm a" value="${post.postDate}" /></time>
                </div>
            </div>
        </c:forEach>
    </div>


</tags:pageTemplate>
