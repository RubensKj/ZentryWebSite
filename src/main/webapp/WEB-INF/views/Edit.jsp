<%--
  Created by IntelliJ IDEA.
  User: ruben
  Date: 3/6/2019
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:url value="/" var="contextPath"/>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${contextPath}resources/css/editPage.css">
    <link rel="icon" href="${contextPath}resources/images/Logo_zentry_BLACK.png">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">


<%--    <script type="text/javascript">--%>
<%--        function check() {--%>
<%--            if( document.getElementById("fileInput").files.length == 0 ){--%>

<%--            }--%>
<%--        }--%>
<%--    </script>--%>
    <style>
        .idHidden {
            display: none;
        }
    </style>
</head>

<tags:pageTemplate titulo="${post.title}">

    <div class="containerEdit">
        <div class="in-progress__cards">
            <div class="big-card in-progress__big-card">
                <h1 class="card-title">Editing</h1>
                <form:form action="${contextPath}post/edited/${post.idPost}" method="post"
                           enctype="multipart/form-data">
                    <input type="text" name="Title" placeholder="Title" class="inputArea" value="${post.title}">
                    <textarea type="text" name="Description" placeholder="Description">${post.description}</textarea>
                    <h3 class="currentImage">Current Image</h3>
                    <input type="hidden" name="image" value="${post.image}">
                    <img src="${post.image}" alt="PostImage">
<%--                    <input type="file" name="file" placeholder="Choose File" class="inputArea" id="fileInput">--%>
                    <input type="hidden" name="postDate" value="${post.postDate}">
                    <button type="submit" class="SubmitBtn">Edit</button>
                </form:form>
            </div>
        </div>
    </div>

</tags:pageTemplate>