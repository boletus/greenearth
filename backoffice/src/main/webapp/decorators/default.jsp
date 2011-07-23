<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <%@ include file="/common/meta.jsp" %>
        <title><decorator:title/> | 短彩业务管理平台</title>
        <link rel="stylesheet" type="text/css" media="all" href="${ctx}/css/default.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/css/messages.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/css/forms.css"/>
		<!--[if lte IE 7]>
		<link href="/css/fixed4ie.css" rel="stylesheet" type="text/css">
		<![endif]-->
        <script src="${ctx}/js/jquery.js" type="text/javascript"></script>
        <script src="${ctx}/js/global.js" type="text/javascript"></script>
        <script src="${ctx}/js/style.js" type="text/javascript"></script>
        <decorator:head/>
    </head>
<body<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>

    <div id="menu">
        <jsp:include page="/common/menu.jsp"/>
    </div>
    
    <!-- wrap starts here -->
    <div id="wrap">
        <div id="header">
            <jsp:include page="/common/header.jsp"/>
        </div>

        <!-- content-wrap starts here -->
        <div id="content-wrap">
            <img src="${ctx}/images/headerphoto.jpg" width="820" height="120" alt="headerphoto" class="no-border" />
            <%@ include file="/common/messages.jsp" %>
            <%--<h1><decorator:getProperty property="meta.heading"/></h1>--%>
            <decorator:body/>
        </div><!-- content-wrap ends here -->

        <!-- footer starts here -->
        <div id="footer">
            <jsp:include page="/common/footer.jsp"/>
        </div><!-- footer ends here -->
    </div><!-- wrap ends here -->
</body>
</html>
