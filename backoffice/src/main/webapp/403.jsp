<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<page:applyDecorator name="default">

<head>
    <title>403 - 缺少权限</title>
    <meta name="heading" content="403 - 缺少权限"/>
</head>

<p>
    <a href="<c:url value="/"/>">返回首页</a> <a href="${ctx}/logout.jsp">退出登录</a>
</p>
<p style="text-align: center; margin-top: 20px">
    <a href="http://community.webshots.com/photo/56793801/56801692jkyHaR"
        title="Hawaii, click to Zoom In">
    <img src="<c:url value="/images/403.jpg"/>" alt="Hawaii" /></a>
</p>
</page:applyDecorator>