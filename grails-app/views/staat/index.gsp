
<%@ page import="de.dhbw.grails.openData.Staat" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'staat.label', default: 'Staat')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-staat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-staat" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'staat.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="laengengrad" title="${message(code: 'staat.laengengrad.label', default: 'Laengengrad')}" />
					
						<g:sortableColumn property="breitengrad" title="${message(code: 'staat.breitengrad.label', default: 'Breitengrad')}" />
					
						<g:sortableColumn property="language" title="${message(code: 'staat.language.label', default: 'Language')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${staatInstanceList}" status="i" var="staatInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${staatInstance.id}">${fieldValue(bean: staatInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: staatInstance, field: "laengengrad")}</td>
					
						<td>${fieldValue(bean: staatInstance, field: "breitengrad")}</td>
					
						<td>${fieldValue(bean: staatInstance, field: "language")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${staatInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
