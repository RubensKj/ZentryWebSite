<%--
  Created by IntelliJ IDEA.
  User: ruben
  Date: 2/26/2019
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="titulo" required="true" %>
<%@ attribute name="bodyClass" required="false" %>

<c:url value="/" var="contextPath"/>

<head>
    <meta charset="UTF-8">
    <link href='${contextPath}resources/css/NavCSS.css' rel="stylesheet"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link rel="icon" href="${contextPath}resources/images/Logo_zentry_BLACK.png"/>
    <title>${titulo } - Zentry</title>

    <meta charset="UTF-8">
    <link rel="stylesheet" href="${contextPath}resources/css/NavCSS.css">
    <link rel="icon" href="${contextPath}resources/images/Logo_zentry_BLACK.png">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <!--    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700|Raleway|Roboto+Slab:400,700"-->
    <!--          rel="stylesheet">-->
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
</head>
<body class="${bodyClass}">

<%@ include file="/WEB-INF/views/cabecalho.jsp" %>

<jsp:doBody/>

<%@ include file="/WEB-INF/views/rodape.jsp" %>

</body>

