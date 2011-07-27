Ext.define('AM.view.Menu', {
	extend: 'Ext.panel.Panel',
	alias: 'widget.menu',

    //requires: ['Ext.toolbar.Toolbar'],

	title: '',
	xtype: 'menu',
	margins: '0 0 5 5',
	split: true,
    collapsible: true,
    animCollapse: true,
	layout: 'fit',
    //layout: 'accordion',
		
	initComponent: function() {
		Ext.apply(this, {
			items: [{
				xtype: 'dataview',
				trackOver: true,
				store: this.store,
				cls: 'feed-list',
				itemSelector: '.feed-list-item',
				overItemCls: 'feed-list-item-hover',
				tpl: '<tpl for="."><div class="feed-list-item">{name}</div></tpl>',
				listeners: {
				    selectionchange: this.onSelectionChange,
				    scope: this
				}
			}/*, {
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
	        }*/],

			dockedItems: [{
				xtype: 'toolbar',
				items: [{
					text: '退出登录',
					action: 'add'
				}, {
					text: '修改密码',
					disabled: true,
					action: 'remove'
				}]
			}]
		});

		this.callParent(arguments);
	},
	
	onSelectionChange: function(selmodel, selection) {
        var selected = selection[0],
            button = this.down('button[action=remove]');
        if (selected) {
            button.enable();
        }
        else {
            button.disable();
        }
	}
});
