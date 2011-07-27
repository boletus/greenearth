Ext.define('AM.store.Menus', {
    extend: 'Ext.data.Store',

    model: 'AM.model.MenuItem',

    data: [
        {name: '客户信息查询',   	url: 'http://feeds.feedburner.com/extblog'},
        {name: '录入分拣结果', 	url: 'http://sencha.com/forum/external.php?type=RSS2'},
        {name: '查看库存',       	url: 'http://feeds.feedburner.com/ajaxian'},
        {name: '销售',       	url: 'http://feeds.feedburner.com/ajaxian'},
        {name: '查看销售记录',       url: 'http://feeds.feedburner.com/ajaxian'},
        {name: '积分规则设定',       url: 'http://feeds.feedburner.com/ajaxian'}
    ]
});