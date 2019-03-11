<%--
  Created by IntelliJ IDEA.
  User: ruben
  Date: 3/5/2019
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<c:url value="/" var="contextPath"/>

<head>
    <link rel="stylesheet" href="${contextPath}resources/css/NewPost.css">
    <link rel="icon" href="${contextPath}resources/images/Logo_zentry_BLACK.png">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <!--    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700|Raleway|Roboto+Slab:400,700"-->
    <!--          rel="stylesheet">-->
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">

    <script type="text/javascript">
        function check() {
            var titleLength = document.getElementById('titleField').value;
            var descriptionLength = document.getElementById('descriptionField').value;

            console.log(titleLength.length);
            console.log(descriptionLength.length);

            if (titleLength.length <= 4 || descriptionLength.length <= 10) {
                document.getElementById("Check").removeAttribute('action');
                // document.getElementById("TitleMiss").style.display = "inline";
                // document.getElementById("DescriptionMiss").style.display = "inline";
            } else {
                document.getElementById("Check").setAttribute('action');
                // document.getElementById("TitleMiss").style.display = "none";
                // document.getElementById("DescriptionMiss").style.display = "none";
            }
        }
    </script>
</head>

<tags:pageTemplate titulo="Posting..">

    <div class="containerNewPost">
        <div class="in-progress__cards">
            <div class="big-card in-progress__big-card">
                <h1 class="card-title">Compose new Post</h1>
                    <%--                <form action="${contextPath}post" method="POST" id="Check">--%>
                <form:form action="${contextPath}post" method="POST" id="Check" enctype="multipart/form-data">
                    <%--                    <p id="TitleMiss" >The post need a Title.</p>--%>
                    <input type="text" name="Title" placeholder="Title" class="inputArea" id="titleField">
                    <%--                    <p id="DescriptionMiss">The post need a description.</p>--%>
                    <textarea type="text" name="Description" placeholder="Description" id="descriptionField"></textarea>
                    <input type="file" name="file" placeholder="Choose File" class="inputArea">
                    <button type="submit" class="SubmitBtn" onclick="check()">Post</button>
                </form:form>
                    <%--                </form>--%>
            </div>
        </div>
    </div>

</tags:pageTemplate>