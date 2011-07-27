<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
<title>Green Earth BackOffice</title>
<link rel="stylesheet" type="text/css" href="${ctx}/ext/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/main.css" />
<style type="text/css">
p {
    margin:5px;
}
.settings {
    background-image:url(${ctx}/icons/fam/folder_wrench.png);
}
.nav {
    background-image:url(${ctx}/icons/fam/folder_go.png);
}
.info {
    background-image:url(${ctx}/icons/fam/information.png);
}
</style>
<script type="text/javascript" src="${ctx}/ext/bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/ext/ext-lang-zh_CN.js"></script>
<!-- script type="text/javascript" src="${ctx}/app.js"></script-->
<script type="text/javascript">
    Ext.require(['*']);

    Ext.onReady(function() {
        Ext.QuickTips.init();

        // NOTE: This is an example showing simple state management. During development,
        // it is generally best to disable state management as dynamically-generated ids
        // can change across page loads, leading to unpredictable results.  The developer
        // should ensure that stable state ids are set for stateful components in real apps.
        Ext.state.Manager.setProvider(Ext.create('Ext.state.CookieProvider'));
        
        var itemsPerPage = 20;
        
        Ext.define('Customer', {
        	extend: 'Ext.data.Model',
        	fields: ['id', 'name', 'cellphone', 'city.name', 'district.name', 'streetAddress', 'barcode',
        	         'createdAt', 'createdBy', 'modifiedAt', 'modifiedBy']
        });
        
        var store = Ext.create('Ext.data.Store', {
            storeId: 'store',
            model: Customer,
            autoLoad: false,
            proxy: {
                type: 'ajax',
                url : 'customer_list.do',
                reader: {
                    type: 'json',
                    root: 'result',
                    totalProperty  : 'totalItems',
                    successProperty: 'success'
                }
            },
/*             data: [
                   {id: 1, name: '张三', cellphone: '13300000000', city_name: '成都', district_name: '武侯区', streetAddress: 'xxx', barcode: '0000001', createdAt: '2011-07-11 23:22:22', createdBy: 'admin', modifiedAt: '', modifedBy: ''},
                   {id: 2, name: '张三', cellphone: '13300000000', city_name: '成都', district_name: '武侯区', streetAddress: 'xxx', barcode: '0000001', createdAt: '2011-07-11 23:22:22', createdBy: 'admin', modifiedAt: '', modifedBy: ''},
                   {id: 3, name: '张三', cellphone: '13300000000', city_name: '成都', district_name: '武侯区', streetAddress: 'xxx', barcode: '0000001', createdAt: '2011-07-11 23:22:22', createdBy: 'admin', modifiedAt: '', modifedBy: ''}
            ], */
            remoteSort: true,
            pageSize: itemsPerPage
        });
        store.load({params: {start: 0, limit: itemsPerPage}});
        
        var grid = Ext.create('Ext.grid.Panel', {
        	region: 'center',
            title: '客户信息',
            store: store,
            columns: [
                {text: '姓名',  dataIndex:'name'},
                {text: '手机号码', dataIndex: 'cellphone'},
                {text: '市', dataIndex: 'city.name'},
                {text: '区', dataIndex: 'district.name'},
                {text: '地址', dataIndex: 'streetAddress'},
                {text: '条码', dataIndex: 'barcode'},
                {text: '创建时间', dataIndex: 'createdAt'},
                {text: '创建者', dataIndex: 'createdBy'},
                {text: '修改时间', dataIndex: 'modifiedAt'},
                {text: '修改者', dataIndex: 'modifiedBy'},
                {
                    xtype: 'actioncolumn',
                    width: 50,
                    items: [{
                        icon: '${ctx}/icons/fam/delete.gif',  // Use a URL in the icon config
                        tooltip: '删除客户',
                        handler: function(grid, rowIndex, colIndex) {
                            var rec = store.getAt(rowIndex);
                            Ext.Ajax.request({
                                url: '/customer_delete.do',
                                params: {
                                    id: rec.get('id'),
                                },
                                success: function(response){
                                    var json = Ext.decode(response.responseText);
                                    if (json.success) {
                                    	Ext.Msg.alert('消息', json.msg, function() {
                                    		grid.getStore().load();
                                    	});
                                    }
                                },
                                failure: function() {
                                	Ext.Msg.alert('错误', '删除失败');
                                }
                            });
                        }
                    }, {
                        icon: '${ctx}/icons/fam/user_edit.png',  // Use a URL in the icon config
                        tooltip: '编辑客户',
                        handler: function(grid, rowIndex, colIndex) {
                            var r = store.getAt(rowIndex);
                            formPanel.getForm().loadRecord(r);
                            dialog.show();
                        }
                    }
                    ]
                }
            ],
            //width: 400,
            //renderTo: Ext.getBody()
            dockedItems: [{
                xtype: 'pagingtoolbar',
                store: store,   // same store GridPanel is using
                dock: 'bottom',
                displayInfo: true
            }],
            tbar: [
                {xtype: 'button', text: '录入', iconCls: 'add16', handler: function() {
                	dialog.show();
                }},
                '-',
                {xtype: 'button', text: '删除', iconCls: 'delete16', handler: function() {
                	
                }}
            ]
        });
        
        var formPanel = new Ext.form.Panel({
            defaultType: 'textfield',
            labelAlign: 'right',
            labelWidth: 70,
            frame: true,
            autoScroll: true,
            title: '录入客户信息',
            url: 'customer_save.do',
            items: [
                    {fieldLabel: 'ID', name: 'id', xtype: 'hiddenfield'},
                    {fieldLabel: '姓名',  name: 'name', allowBlank: false},
                    {fieldLabel: '手机号码', name: 'cellphone', allowBlank: false},
                    {fieldLabel: '市', name: 'cityId'},
                    {fieldLabel: '区', name: 'districtId'},
                    {fieldLabel: '地址', name: 'streetAddress', allowBlank: false},
                    {fieldLabel: '条码', name: 'barcode', allowBlank: false}
            ],
            buttons: [{
                text: '确定',
                handler: function() {
                    var form = this.up('form').getForm();
                    if (form.isValid()) {
                        form.submit({
                            success: function(form, action) {
                               Ext.Msg.alert('Success', action.result.msg);
                               grid.getStore().load();
                               dialog.hide();
                            },
                            failure: function(form, action) {
                                Ext.Msg.alert('Failed', action.result.msg);
                            }
                        });
                    }
                }
            }, {
                text: '清空',
                handler: function() {
                    this.up('form').getForm().reset();
                }
            }, {
                text: '取消',
                handler: function() {
                    dialog.hide();
                }
            }]
        });
        var dialog = new Ext.window.Window({
            layout: 'fit',
            width: 400,
            height: 300,
            closeAction: 'hide',
            items: [formPanel]
        });

        var viewport = Ext.create('Ext.container.Viewport', {
            id: 'border-example',
            layout: 'border',
            items: [
            // create instance immediately
            Ext.create('Ext.Component', {
                region: 'north',
                height: 32, // give north and south regions a height
                autoEl: {
                    tag: 'div',
                    html:'<div id="head">Green Earth系统</p>'
                }
            }), {
                region: 'west',
                stateId: 'navigation-panel',
                id: 'west-panel', // see Ext.getCmp() below
                title: '',
                split: true,
                width: 200,
                minWidth: 175,
                maxWidth: 400,
                collapsible: true,
                animCollapse: true,
                margins: '0 0 5 5',
                layout: 'accordion',
                items: [{
                    contentEl: 'west',
                    title: 'Navigation',
                    iconCls: 'nav' // see the HEAD section for style used
                }, {
                    title: 'Settings',
                    html: '<p>Some settings in here.</p>',
                    iconCls: 'settings'
                }, {
                    title: 'Information',
                    html: '<p>Some info in here.</p>',
                    iconCls: 'info'
                }]
            }, 
            grid
            ]
        });
    });
    </script>
</head>
<body>
    <!-- use class="x-hide-display" to prevent a brief flicker of the content -->
    <div id="west" class="x-hide-display">
        <p>
            <ul>
                <li><img src="${ctx}/icons/fam/folder_wrench.png" class="icon-page"><a href="${ctx}/customer.do" id="link1" title="客户信息查询">客户信息查询</a></li>
                <li><img src="${ctx}/icons/fam/folder_wrench.png" class="icon-page"><a href="#" id="link1" title="链接1">链接1</a></li>
                <li><img src="${ctx}/icons/fam/folder_wrench.png" class="icon-page"><a href="#" id="link1" title="链接1">链接1</a></li>
            </ul>
        </p>
    </div>
    <div id="center1" class="x-hide-display">
        <p>欢迎使用Green Earth系统</p>
    </div>
</body>
</html>