Ext.define('AM.view.Home', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.home',
    layout: 'fit',
    
    initComponent: function() {
        this.items = [{
        	contentEl: 'center',
            autoScroll: true
        }];
        
        this.callParent(arguments);
    }
});