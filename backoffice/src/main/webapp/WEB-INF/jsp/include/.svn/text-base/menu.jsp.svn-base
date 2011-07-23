<%@ page language="java" pageEncoding="UTF-8"%>
var item_list=[];
var item_index=0;
var a=${module_id};
<c:forEach items="${worker.allModules[module_id]}" var="module">
	<c:if test="${module['module_id'] ne module_id }">
var ${module['module_name']} = new Litb.MenuPanel({
	id:'${module['module_name']}',
	title:'${module['description']}',
	childs:[
	<c:forEach items="${worker.allMenu[module['module_id']]}" var="menu">
	{
			text: '${menu['menu_name'] }',
			iconCls:'icon-cart',
			url:'${ctx}/${menu['menu_action'] }'
		},
		</c:forEach>
	]
});
item_list[item_index++]=${module['module_name']};
	</c:if>
</c:forEach>
Ext.leftPanel = new Litb.ActionPanel({
	items: item_list
 });
