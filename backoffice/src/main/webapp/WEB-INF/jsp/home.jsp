<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
<title>Complex Layout</title>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/main.css" />
<style type="text/css">
p {
    margin:5px;
}
.settings {
    background-image:url(${ctx}/icons/fam/folder_wrench.png);
}
.nav {
    background-image:url(${ctx}/icons/fam/folder_go.png);
}
.info {
    background-image:url(${ctx}/icons/fam/information.png);
}
</style>
<script type="text/javascript" src="${ctx}/js/bootstrap.js"></script>
<%-- <script type="text/javascript" src="${ctx}/js/ext-bo.js"></script> 
<script type="text/javascript" src="${ctx}/js/Ext.lingo.JsonGrid.js"></script>
<script type="text/javascript" src="${ctx}/js/Ext.lingo.JsonTree.js"></script>
<script type="text/javascript" src="${ctx}/js/Ext.ux.PageSizePlugin.js"></script>
<script type="text/javascript" src="${ctx}/js/tracker/tracker.js"></script>
<script type="text/javascript" src="${ctx}/js/tracker/tree.js"></script>
<script type="text/javascript" src="${ctx}/js/tracker/grid.js"></script>--%>
<script type="text/javascript">
    Ext.require(['*']);

    Ext.onReady(function() {
        Ext.QuickTips.init();

        // NOTE: This is an example showing simple state management. During development,
        // it is generally best to disable state management as dynamically-generated ids
        // can change across page loads, leading to unpredictable results.  The developer
        // should ensure that stable state ids are set for stateful components in real apps.
        Ext.state.Manager.setProvider(Ext.create('Ext.state.CookieProvider'));
        
        var viewport = Ext.create('Ext.container.Viewport', {
            id: 'border-example',
            layout: 'border',
            items: [
            // create instance immediately
            Ext.create('Ext.Component', {
                region: 'north',
                height: 32, // give north and south regions a height
                autoEl: {
                    tag: 'div',
                    html:'<div id="head">Green Earth系统</p>'
                }
            }), {
                region: 'west',
                stateId: 'navigation-panel',
                id: 'west-panel', // see Ext.getCmp() below
                title: '',
                split: true,
                width: 200,
                minWidth: 175,
                maxWidth: 400,
                collapsible: true,
                animCollapse: true,
                margins: '0 0 5 5',
                layout: 'accordion',
                items: [{
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
                }]
            }, Ext.create('Ext.tab.Panel', {
                region: 'center', // a center region is ALWAYS required for border layout
                deferredRender: false,
                activeTab: 0,     // first tab initially active
                margins: '0 5 5 0',
                items: [{
                    contentEl: 'center1',
                    title: '欢迎',
                    autoScroll: true
                }]
            })]
        });
    });
    </script>
</head>
<body>
    <!-- use class="x-hide-display" to prevent a brief flicker of the content -->
    <div id="west" class="x-hide-display">
        <p>
            <ul>
                <li><img src="${ctx}/icons/fam/folder_wrench.png" class="icon-page"><a href="${ctx}/customer.do" id="link1" title="客户信息查询">客户信息查询</a></li>
                <li><img src="${ctx}/icons/fam/folder_wrench.png" class="icon-page"><a href="#" id="link1" title="链接1">链接1</a></li>
                <li><img src="${ctx}/icons/fam/folder_wrench.png" class="icon-page"><a href="#" id="link1" title="链接1">链接1</a></li>
            </ul>
        </p>
    </div>
    <div id="center1" class="x-hide-display">
        <p>欢迎使用Green Earth系统</p>
    </div>
</body>
</html>