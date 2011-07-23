<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<menu:useMenuDisplayer name="Velocity" config="/templates/cssMenu.html" repository="repository" permissions="permissionsAdapter">
  <ul id="primary-nav" class="menuList">
      <c:forEach var="menu" items="${repository.topMenus}">
        <menu:displayMenu name="${menu.name}"/>
      </c:forEach>
  </ul>
</menu:useMenuDisplayer>