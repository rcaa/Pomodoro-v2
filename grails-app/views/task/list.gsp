
<%@ page import="pomodoro.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-task" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="summary" title="${message(code: 'task.summary.label', default: 'Summary')}" />
					
						<g:sortableColumn property="details" title="${message(code: 'task.details.label', default: 'Details')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'task.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="deadline" title="${message(code: 'task.deadline.label', default: 'Deadline')}" />
					
						<g:sortableColumn property="timeSpent" title="${message(code: 'task.timeSpent.label', default: 'Time Spent')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'task.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${taskInstanceList}" status="i" var="taskInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "summary")}</g:link></td>
					
						<td>${fieldValue(bean: taskInstance, field: "details")}</td>
					
						<td>${fieldValue(bean: taskInstance, field: "status")}</td>
					
						<td><g:formatDate date="${taskInstance.deadline}" /></td>
					
						<td>${fieldValue(bean: taskInstance, field: "timeSpent")}</td>
					
						<td><g:formatDate date="${taskInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${taskInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
