

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'datagraph.label', default:'Datagraph')}" />
        <title>${entityName} List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>${entityName} List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="${message(code:'datagraph.id.label', default:'Id')}" />
                        
                   	        <g:sortableColumn property="countfalse" title="${message(code:'datagraph.countfalse.label', default:'Countfalse')}" />
                        
                   	        <g:sortableColumn property="counttrue" title="${message(code:'datagraph.counttrue.label', default:'Counttrue')}" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="${message(code:'datagraph.lastUpdated.label', default:'Last Updated')}" />
                        
                   	        <g:sortableColumn property="numberofnews" title="${message(code:'datagraph.numberofnews.label', default:'Numberofnews')}" />
                        
                   	        <g:sortableColumn property="percentofcutword" title="${message(code:'datagraph.percentofcutword.label', default:'Percentofcutword')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${datagraphInstanceList}" status="i" var="datagraphInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${datagraphInstance.id}">${fieldValue(bean:datagraphInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:datagraphInstance, field:'countfalse')}</td>
                        
                            <td>${fieldValue(bean:datagraphInstance, field:'counttrue')}</td>
                        
                            <td>${fieldValue(bean:datagraphInstance, field:'lastUpdated')}</td>
                        
                            <td>${fieldValue(bean:datagraphInstance, field:'numberofnews')}</td>
                        
                            <td>${fieldValue(bean:datagraphInstance, field:'percentofcutword')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${datagraphInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
