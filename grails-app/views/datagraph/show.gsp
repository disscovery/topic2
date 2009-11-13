

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'datagraph.label', default:'Datagraph')}" />
        <title>Show ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>Show ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="datagraph.id.label" default="Id" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:datagraphInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="datagraph.countfalse.label" default="Countfalse" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:datagraphInstance, field:'countfalse')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="datagraph.counttrue.label" default="Counttrue" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:datagraphInstance, field:'counttrue')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="datagraph.lastUpdated.label" default="Last Updated" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:datagraphInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="datagraph.numberofnews.label" default="Numberofnews" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:datagraphInstance, field:'numberofnews')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">
                               <g:message code="datagraph.percentofcutword.label" default="Percentofcutword" />:
                            </td>
                            
                            <td valign="top" class="value">${fieldValue(bean:datagraphInstance, field:'percentofcutword')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${datagraphInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
