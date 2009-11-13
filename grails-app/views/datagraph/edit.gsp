

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'datagraph.label', default:'Datagraph')}" />
        <title>Edit ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${datagraphInstance}">
            <div class="errors">
                <g:renderErrors bean="${datagraphInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${datagraphInstance?.id}" />
                <input type="hidden" name="version" value="${datagraphInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countfalse">
                                    <g:message code="datagraph.countfalse.label" default="Countfalse" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:datagraphInstance,field:'countfalse','errors')}">
                                    <input type="text" id="countfalse" name="countfalse" value="${fieldValue(bean:datagraphInstance,field:'countfalse')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="counttrue">
                                    <g:message code="datagraph.counttrue.label" default="Counttrue" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:datagraphInstance,field:'counttrue','errors')}">
                                    <input type="text" id="counttrue" name="counttrue" value="${fieldValue(bean:datagraphInstance,field:'counttrue')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastUpdated">
                                    <g:message code="datagraph.lastUpdated.label" default="Last Updated" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:datagraphInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${datagraphInstance?.lastUpdated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="numberofnews">
                                    <g:message code="datagraph.numberofnews.label" default="Numberofnews" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:datagraphInstance,field:'numberofnews','errors')}">
                                    <input type="text" id="numberofnews" name="numberofnews" value="${fieldValue(bean:datagraphInstance,field:'numberofnews')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="percentofcutword">
                                    <g:message code="datagraph.percentofcutword.label" default="Percentofcutword" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:datagraphInstance,field:'percentofcutword','errors')}">
                                    <input type="text" id="percentofcutword" name="percentofcutword" value="${fieldValue(bean:datagraphInstance,field:'percentofcutword')}" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
