Ext.define('AM.controller.Home', {
    extend: 'Ext.app.Controller',
    
    stores: [
        'Menus', 'Customers'
    ],
 
    views: [
        'Home', 'customer.Grid'
    ],
    
    models: [
        'MenuItem', 'Customer'
    ],
    
    refs: [
           {ref: 'mainView', selector: 'mainview'},
           {ref: 'menuItemData', selector: 'menu dataview'},
//           {ref: 'customerGrid', selector: 'customergrid'},
           {
               ref: 'customerTab',
               xtype: 'customergrid',
               closable: true,
               forceCreate: true,
               selector: 'customergrid'
           }
    ],
 
    init: function() {
        this.control({
            'menu dataview': {
                selectionchange: this.switchView
            }
        });
    },
    
    onLaunch: function() {
        var menuview = this.getMenuItemData(),
            store = this.getMenusStore();
            
        menuview.bindStore(store);
//        menuview.getSelectionModel().select(store.getAt(0));
    },
    
    switchView: function(selModel, selected) {
        var mainView = this.getMainView(),
        	menu = selected[0];
        
        if (menu) {
        	
        }
            
        tab = this.getCustomerTab();
        tab.enable();

//        tab.setTitle(title);
//        tab.article = article;
//        tab.articleId = articleId;
//        tab.update(article.data);

//        if (preventAdd !== true) {
            mainView.add(tab);
            mainView.setActiveTab(tab);            
//        }
        
        return tab;
    }
});