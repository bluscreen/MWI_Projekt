
<%@ page import="de.dhbw.grails.openData.Bildungseinrichtung" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bildungseinrichtung.label', default: 'Bildungseinrichtung')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bildungseinrichtung" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bildungseinrichtung" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'bildungseinrichtung.name.label', default: 'Name')}" />
					
						<th><g:message code="bildungseinrichtung.ort.label" default="Ort" /></th>
					
						<g:sortableColumn property="email" title="${message(code: 'bildungseinrichtung.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="webpage" title="${message(code: 'bildungseinrichtung.webpage.label', default: 'Webpage')}" />
					
						<g:sortableColumn property="laengengrad" title="${message(code: 'bildungseinrichtung.laengengrad.label', default: 'Laengengrad')}" />
					
						<g:sortableColumn property="breitengrad" title="${message(code: 'bildungseinrichtung.breitengrad.label', default: 'Breitengrad')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bildungseinrichtungInstanceList}" status="i" var="bildungseinrichtungInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bildungseinrichtungInstance.id}">${fieldValue(bean: bildungseinrichtungInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: bildungseinrichtungInstance, field: "ort")}</td>
					
						<td>${fieldValue(bean: bildungseinrichtungInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: bildungseinrichtungInstance, field: "webpage")}</td>
					
						<td>${fieldValue(bean: bildungseinrichtungInstance, field: "laengengrad")}</td>
					
						<td>${fieldValue(bean: bildungseinrichtungInstance, field: "breitengrad")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bildungseinrichtungInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
