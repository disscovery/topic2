

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'vocab.label', default:'Vocab')}" />
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
                        
                   	        <g:sortableColumn property="id" title="${message(code:'vocab.id.label', default:'Id')}" />
                        
                   	        <g:sortableColumn property="vocab" title="${message(code:'vocab.vocab.label', default:'Vocab')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${vocabInstanceList}" status="i" var="vocabInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${vocabInstance.id}">${fieldValue(bean:vocabInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:vocabInstance, field:'vocab')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${vocabInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
