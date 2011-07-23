<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<c:set var="ctx" value="<%=request.getContextPath()%>" />
<c:if test="${ctx eq '/'}">
	<c:set var="ctx" value="" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="${ctx}/litb-pub/warehouse.ico" type="image/x-icon" />
<link rel="icon" href="${ctx}/litb-pub/warehouse.ico" type="image/ico" />
<meta http-equiv="pragma" content="no-cache">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="expires" CONTENT="0">
<link rel="stylesheet" type="text/css" href="${ctx}/litb-pub/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/litb-pub/resources/css/litb.css" />
<script type="text/javascript" src="${ctx}/litb-pub/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="${ctx}/litb-pub/ext-all.js"></script>
<script type="text/javascript" src="${ctx}/litb-pub/ext-lang-zh_CN.js"></script>
<script type="text/javascript">
	Ext.BLANK_IMAGE_URL = '${ctx}/litb-pub/resources/images/default/s.gif';
	Ext.skuGetAttrUrl = '/skuapi?a=attr&pid=';
	Ext.skuMakeUrl = '/skuapi?a=sku';
</script>
<script type="text/javascript" src="${ctx}/litb-pub/litb-function.js"></script>
<script type="text/javascript" src="${ctx}/litb-pub/litb-plugin.js"></script>
<script type="text/javascript">
Ext.onReady(function(){
	Ext.QuickTips.init();
})
//仓库
Ext.warehouseArr = [<c:forEach items="${warehouseAllList}" var="entry" varStatus="sta">
		['${entry["warehouse_id"]}','${entry["warehouse_name"]}']<c:if test="${not sta.last}">,</c:if>
		</c:forEach>];
Ext.arrAll = ['','全部'];
Ext.barCodeObj = {'string':'textfield','int':'numberfield','date':'datefield'};
Ext.imagePath = '${ctx}/litb-pub/img/';
//使用cookies
var cp = new Ext.state.CookieProvider();
