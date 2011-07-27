Ext.define('AM.view.customer.Edit', {
    extend: 'Ext.window.Window',
    alias : 'widget.customeredit',
 
//    title : '编辑客户信息',
    layout: 'fit',
    autoShow: true,
    width: 400,
    height: 300,
    closeAction: 'hide',
    url: 'customer_save.do',
    
    config: {
    	title: '客户信息'
    },
    
    /*constructor: function(config) {
        this.initConfig(config);
 
        return this;
    },*/
 
    initComponent: function() {
        this.items = [
            {
                xtype: 'form',
                items: [
					{
                        xtype: 'hiddenfield',
                        name : 'id',
                        fieldLabel: 'ID'
                    },
					{
                        xtype: 'textfield',
                        name : 'name',
                        fieldLabel: '姓名',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name : 'cellphone',
                        fieldLabel: '手机号码',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name : 'cityId',
                        fieldLabel: '市',
                    },
                    {
                        xtype: 'textfield',
                        name : 'districtId',
                        fieldLabel: '区'
                    },
                    {
                        xtype: 'textfield',
                        name : 'streetAddress',
                        fieldLabel: '地址',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name : 'barcode',
                        fieldLabel: '条码',
                        allowBlank: false
                    }
                ]
            }
        ];
 
        this.buttons = [
            {
                text: '保存',
                action: 'save'
            },
            {
                text: '取消',
                scope: this,
                handler: this.close
            }
        ];
 
        this.callParent(arguments);
    }
});