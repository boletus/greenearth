Ext.define('AM.view.MainView', {
    extend: 'Ext.tab.Panel',
    alias: 'widget.mainview',
    
    requires: ['AM.view.customer.Grid'],
    
    activeItem: 0,
    margins: '0 5 5 0',
//    deferredRender: false,
//    activeTab: 0,     // first tab initially active
    
    cls: 'preview',
    
    initComponent: function() {
        this.items = [/*{
            xtype: 'customergrid',
            title: '客户信息'
        }*/ {
            xtype: 'home',
            title: '欢迎'
        }];
        
        this.callParent(arguments);
    }
});