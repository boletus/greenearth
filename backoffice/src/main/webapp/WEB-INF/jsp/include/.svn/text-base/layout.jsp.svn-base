<%@ page language="java" pageEncoding="UTF-8"%>
var viewport = new Ext.Viewport({
		layout:'border',
		items: [
		  new Litb.NavBar({childs:[
	<c:if test="${worker.user['login_name'] ne 'root'}" >
	<c:forEach items="${worker.modules}" var="modules">
		<c:set  var="module_entity" value="${modules[0]}" />
		<c:set  var="default_action" value="${worker.allMenu[modules[1]['module_id']][0]}" />
		{url:'${ctx}/${default_action['menu_action']}',text:'${module_entity['description']}',id:'${module_entity['module_name']}'}
			 ,
		</c:forEach>
	</c:if>
	<c:if test="${worker.user['login_name'] eq 'root'}" >
			{url:'${ctx}/barcodepurchase.do',text:'条码',id:'barcode'}
			 ,
			{url:'${ctx}/receivepurchase.do',text:'收货',id:'receive'}
			 ,
			{url:'${ctx}/qcreceive.do',text:'质检',id:'qcreceive'}
			 ,
			{url:'${ctx}/toplace.do',text:'上架',id:'place'}
			 ,
			{url:'${ctx}/assignExpress.do',text:'拣选',id:'pick'}
			 ,
			{url:'${ctx}/invoice.do',text:'打单',id:'invoice'}
			 ,
			{url:'${ctx}/rebin.do',text:'Rebin',id:'rebin'}
			 ,
			 {url:'${ctx}/pack.do',text:'包装',id:'pack'}
			 ,
			 {url:'${ctx}/shipment.do',text:'出库',id:'shipment'}
			 ,
			 {url:'${ctx}/transferreceivingpostprocess.do',text:'其它',id:'others'}
			 ,
			 {url:'${ctx}/placementinventory.do',text:'报表',id:'placementinventory'}
			 ,
			{url:'${ctx}/account.do',text:'系统设置',id:'system'}
	</c:if>
		],
			cls:'wms',
			info:'<div style="float:left" id="warhouse"></div>&nbsp;&nbsp;欢迎您：${worker.user['user_name']}<c:if test="${worker.user['with_google'] eq false}" >(<a href="#" id="resetPassword" title="resetPassword">修改密码</a>)</c:if>&nbsp;|&nbsp;<a href="${ctx}/logout.do">退出系统</a>&nbsp;'}),
			Ext.leftPanel,
			Ext.mainPanel/*,
	   	  {xtype:'panel',
	   	  	collapsible: true,
			collapseMode: 'mini',
			header: false,
			region:'south',
			height:18,
			maxHeight:18,
			split:true,
			border:false,
			stateful:true,
			collapsed:true,
			bodyStyle:'background:#CAD9EC;font-size:12px; line-height:18px; text-align:center; font-family:arial',
			html:'<span style="font-size:12px;">&copy;</span> lightinthebox.com 2009-2010&nbsp;&nbsp;<a href="http://v3.litb-inc.com" target="_blank" title="采购中心">采购中心</a>&nbsp;|&nbsp;<a href="http://order.litb-inc.com" target="_blank" title="订单中心">订单中心</a>&nbsp;|&nbsp;<a href="http://wms.litb-inc.com" target="_blank" title="仓库中心">仓库中心</a>&nbsp;|&nbsp;<a href="http://pc.litb-inc.com" target="_blank" title="产品中心">产品中心</a>'}*/]
});
//仓库
<c:if test="${worker.user['login_name'] eq 'root'}" >
new Litb.Combo({
	value:'${currentWarehouse}',
	options:Ext.warehouseArr,
	width:80,
	renderTo:'warhouse',
	listeners: {select:function(combo,item){
		new Litb.ajax({
			url:'${ctx}/login_changewarehouse.do?warehouseId='+item.data.field1,
			method:'GET',
			success:function(){
				location.reload();
			}
		});
	}}
});
	</c:if>
<c:if test="${worker.user['with_google'] eq false}" >
//重新设置密码
Ext.get('resetPassword').on('click',function(){
	var fs = new Litb.FormPanel({
			tbar:[{text:'保存',ctCls:'x-btn-over',iconCls:'icon-save',handler:function(){
					Litb.submitForm(fs);
				}
			}],
			url:'account_password.do',
			defaults: {
				inputType: 'password',
				xtype:'textfield'
			},
			items:[
				{fieldLabel:'原始密码',allowBlank:false,name:'oldpass'},
				{fieldLabel:'新密码',allowBlank:false,name:'newpass1',id:'newpass1'},
				{fieldLabel:'新密码确认',allowBlank:false,name:'newpass2',vtype: 'password',
					initialPassField: 'newpass1'}
			],
			success:function(r){
					Ext.Msg.alert('操作成功', r.detail,function(){
								win.hide();
					});
			}
		})
	var win = new Litb.PopUp({
		type:'s',
		title:'重新设置${worker.user['user_name']}的密码',
		items:fs
	}).show();
})
</c:if>
//获取左面的菜单事件