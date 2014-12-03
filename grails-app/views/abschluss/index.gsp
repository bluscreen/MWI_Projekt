
<%@ page import="de.dhbw.grails.openData.Abschluss" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'abschluss.label', default: 'Abschluss')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-abschluss" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-abschluss" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="abschluss.bildungseinrichtung.label" default="Bildungseinrichtung" /></th>
					
						<g:sortableColumn property="abschlussdatum" title="${message(code: 'abschluss.abschlussdatum.label', default: 'Abschlussdatum')}" />
					
						<g:sortableColumn property="note" title="${message(code: 'abschluss.note.label', default: 'Note')}" />
					
						<th><g:message code="abschluss.person.label" default="Person" /></th>
					
						<g:sortableColumn property="thema" title="${message(code: 'abschluss.thema.label', default: 'Thema')}" />
					
						<g:sortableColumn property="titel" title="${message(code: 'abschluss.titel.label', default: 'Titel')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${abschlussInstanceList}" status="i" var="abschlussInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${abschlussInstance.id}">${fieldValue(bean: abschlussInstance, field: "bildungseinrichtung")}</g:link></td>
					
						<td><g:formatDate date="${abschlussInstance.abschlussdatum}" /></td>
					
						<td>${fieldValue(bean: abschlussInstance, field: "note")}</td>
					
						<td>${fieldValue(bean: abschlussInstance, field: "person")}</td>
					
						<td>${fieldValue(bean: abschlussInstance, field: "thema")}</td>
					
						<td>${fieldValue(bean: abschlussInstance, field: "titel")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${abschlussInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
