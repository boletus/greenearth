Ext.define('AM.controller.Customers', {
    extend: 'Ext.app.Controller',
    
    stores: [
        'Customers', 'Menus'
    ],
 
    views: [
        'user.List',
        'user.Edit',
        'customer.Grid',
        'customer.Edit'
    ],
    
    models: [
        'User', 'MenuItem', 'Customer'
    ],
    
    refs: [
           {ref: 'menuItemData', selector: 'menu dataview'},
           {ref: 'customerGrid', selector: 'customergrid'},
    ],
    
    init: function() {
        this.control({
        	'viewport > mainview customergrid': {
                itemdblclick: this.editCustomer
            },
            'viewport > mainview customergrid button[action=add]': {
                click: this.addCustomer
            },
            'customeredit button[action=save]': {
                click: this.updateCustomer
            },
            /*'menu dataview': {
                selectionchange: this.loadCustomer
            },*/
            'menu button[action=add]': {
                click: this.addFeed
            },
            'menu button[action=remove]': {
                click: this.removeFeed
            }
        });
    },
    
    /*onLaunch: function() {
        var menuview = this.getMenuItemData(),
            store = this.getMenusStore();
            
        menuview.bindStore(store);
        menuview.getSelectionModel().select(store.getAt(0));
    },*/
 
    addCustomer: function(grid) {
    	console.log('add customer');
    	var view = Ext.widget('customeredit');
    	view.setTitle('录入客户信息');
    	blankRecord = this.getCustomerModel().create({});
    	view.down('form').loadRecord(blankRecord);
    },
    
    editCustomer: function(grid, record) {
    	var view = Ext.widget('customeredit');
    	view.setTitle('编辑客户信息');
        view.down('form').loadRecord(record);
    },
    
    updateCustomer: function(button) {
        var win    = button.up('window'),
            form   = win.down('form'),
            record = form.getRecord(),
            values = form.getValues();
        record.set(values);
     
        /*if (record) {
        	// 修改
        	record.set(values);
        } else {
        	// 新增
            store = this.getCustomersStore(),
            console.log(form.down('textfield[name=name]').getValue());
            customer  = this.getFeedModel().create({
                name: form.down('textfield[name=name]').getValue(),
                cellphone: form.down('textfield[name=cellphone]').getValue(),
//                city.id: form.down('textfield[name=name]').getValue(),
//                district.id: form.down('textfield[name=name]').getValue(),
                streetAddress: form.down('textfield[name=streetAddress]').getValue(),
                barcode: form.down('textfield[name=barcode]').getValue()
            });
        }*/
        win.close();
        
        this.getCustomersStore().sync();
    },
    
    loadCustomer: function(selModel, selected) {
        var grid = this.getCustomerGrid(),
            store = this.getCustomersStore(),
            menu = selected[0];
        if (menu) {
            grid.enable();
            store.load(/*{
                params: {
                	start: 0,
                	limit: this.itemsPerPage
                }
            }*/);            
        }
    }
});