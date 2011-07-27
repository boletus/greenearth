Ext.define('AM.model.MenuItem', {
    extend: 'Ext.data.Model',
    
    proxy: {
        type: 'memory'
    },
    
    fields: [
        {name: 'url',  type: 'string'},
        {name: 'name', type: 'string'}
    ]
});