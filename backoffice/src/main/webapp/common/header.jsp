<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<h1 id="logo">短彩业务<span class="green">管理</span><span class="gray">平台</span></h1>
<h2 id="slogan">&copy; Walt Disney DIMG</h2>

<form method="post" class="searchform" action="#">
    <p><input type="text" name="search_query" class="textbox" />
    <input type="submit" name="search" class="button" value="Search" /></p>
</form>
<!-- Menu Tabs -->
<ul>
    <li id="current"><a href="${ctx}/mainMenu.do"><span>首页</span></a></li>
    <li><a href="${ctx}/editProfile.do"><span>帐户信息</span></a></li>
    <li><a href="#"><span>帮助</span></a></li>
    <li><a href="${ctx}/logout.jsp"><span>退出</span></a></li>
</ul>