
<%@ page import="pomodoro.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-task" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list task">
			
				<g:if test="${taskInstance?.summary}">
				<li class="fieldcontain">
					<span id="summary-label" class="property-label"><g:message code="task.summary.label" default="Summary" /></span>
					
						<span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${taskInstance}" field="summary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.details}">
				<li class="fieldcontain">
					<span id="details-label" class="property-label"><g:message code="task.details.label" default="Details" /></span>
					
						<span class="property-value" aria-labelledby="details-label"><g:fieldValue bean="${taskInstance}" field="details"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="task.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${taskInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.deadline}">
				<li class="fieldcontain">
					<span id="deadline-label" class="property-label"><g:message code="task.deadline.label" default="Deadline" /></span>
					
						<span class="property-value" aria-labelledby="deadline-label"><g:formatDate date="${taskInstance?.deadline}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.timeSpent}">
				<li class="fieldcontain">
					<span id="timeSpent-label" class="property-label"><g:message code="task.timeSpent.label" default="Time Spent" /></span>
					
						<span class="property-value" aria-labelledby="timeSpent-label"><g:fieldValue bean="${taskInstance}" field="timeSpent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="task.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${taskInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="task.tags.label" default="Tags" /></span>
					
						<g:each in="${taskInstance.tags}" var="t">
						<span class="property-value" aria-labelledby="tags-label"><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${taskInstance?.id}" />
					<g:link class="edit" action="edit" id="${taskInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
