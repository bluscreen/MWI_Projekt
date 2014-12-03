
<%@ page import="de.dhbw.grails.openData.Ort" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ort.label', default: 'Ort')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ort" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ort" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'ort.name.label', default: 'Name')}" />
					
						<th><g:message code="ort.staat.label" default="Staat" /></th>
					
						<g:sortableColumn property="laengengrad" title="${message(code: 'ort.laengengrad.label', default: 'Laengengrad')}" />
					
						<g:sortableColumn property="breitengrad" title="${message(code: 'ort.breitengrad.label', default: 'Breitengrad')}" />
					
						<g:sortableColumn property="postleitzahl" title="${message(code: 'ort.postleitzahl.label', default: 'Postleitzahl')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ortInstanceList}" status="i" var="ortInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ortInstance.id}">${fieldValue(bean: ortInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: ortInstance, field: "staat")}</td>
					
						<td>${fieldValue(bean: ortInstance, field: "laengengrad")}</td>
					
						<td>${fieldValue(bean: ortInstance, field: "breitengrad")}</td>
					
						<td>${fieldValue(bean: ortInstance, field: "postleitzahl")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ortInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
