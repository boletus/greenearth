Ext.define('AM.view.customer.Grid', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.customergrid',

	cls: 'feed-grid',
	disabled: true,    
    border: false,
    title: '客户信息',
    
    requires: ['Ext.toolbar.Toolbar'],
    
    initComponent: function() {
		Ext.apply(this, {
		    store: 'Customers',

			/*viewConfig: {
				plugins: [{
					pluginId: 'preview',
					ptype: 'preview',
					bodyField: 'description',
					previewExpanded: true
				}]
			},*/

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
	                    icon: 'icons/fam/delete.gif',  // Use a URL in the icon config
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
	                    icon: '/icons/fam/user_edit.png',  // Use a URL in the icon config
	                    tooltip: '编辑客户',
	                    handler: function(grid, rowIndex, colIndex) {
	                        var r = store.getAt(rowIndex);
	                        formPanel.getForm().loadRecord(r);
	                        dialog.show();
	                    }
	                }
	                ]
	            }],
            dockedItems: [{
                xtype: 'pagingtoolbar',
                store: 'Customers',   // same store GridPanel is using
                dock: 'bottom',
                displayInfo: true
            }, {
				xtype: 'toolbar',
				dock: 'top',
				items: [{
					text: '录入',
					action: 'add',
					iconCls: 'add16'
				}, '-', {
					text: '删除',
					action: 'openall',
					iconCls: 'delete16'
				}]
			}]
		});

		this.callParent(arguments);
	}
});