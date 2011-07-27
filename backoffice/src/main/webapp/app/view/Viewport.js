Ext.define('AM.view.Viewport', {
	extend: 'Ext.container.Viewport',
	
	requires: [
	           'AM.view.Menu',
	           'AM.view.customer.Grid',
	           'AM.view.MainView'
	       ],
	
    id: 'mainViewport',
    layout: 'border',
    items: [
    // create instance immediately
    Ext.create('Ext.Component', {
        region: 'north',
        height: 32, // give north and south regions a height
        autoEl: {
            tag: 'div',
            html:'<div id="head">Green Earth</p>'
        }
    }), {
		region: 'west',
		width: 225,
		xtype: 'menu'
	}, {
		region: 'center',
		xtype: 'mainview'
	}/*, Ext.create('Ext.tab.Panel', {
        region: 'center', // a center region is ALWAYS required for border layout
        deferredRender: false,
        activeTab: 0,     // first tab initially active
        margins: '0 5 5 0',
        items: [{
            contentEl: 'center',
            title: 'Close Me',
            closable: true,
            autoScroll: true
        }]
    })*/]
});