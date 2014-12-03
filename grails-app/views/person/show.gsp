
<%@ page import="de.dhbw.grails.openData.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">
			
				<g:if test="${personInstance?.nachname}">
				<li class="fieldcontain">
					<span id="nachname-label" class="property-label"><g:message code="person.nachname.label" default="Nachname" /></span>
					
						<span class="property-value" aria-labelledby="nachname-label"><g:fieldValue bean="${personInstance}" field="nachname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.vorname}">
				<li class="fieldcontain">
					<span id="vorname-label" class="property-label"><g:message code="person.vorname.label" default="Vorname" /></span>
					
						<span class="property-value" aria-labelledby="vorname-label"><g:fieldValue bean="${personInstance}" field="vorname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.beruf}">
				<li class="fieldcontain">
					<span id="beruf-label" class="property-label"><g:message code="person.beruf.label" default="Beruf" /></span>
					
						<span class="property-value" aria-labelledby="beruf-label"><g:link controller="beruf" action="show" id="${personInstance?.beruf?.id}">${personInstance?.beruf?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.abschluesse}">
				<li class="fieldcontain">
					<span id="abschluesse-label" class="property-label"><g:message code="person.abschluesse.label" default="Abschluesse" /></span>
					
						<g:each in="${personInstance.abschluesse}" var="a">
						<span class="property-value" aria-labelledby="abschluesse-label"><g:link controller="abschluss" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.geburtsdatum}">
				<li class="fieldcontain">
					<span id="geburtsdatum-label" class="property-label"><g:message code="person.geburtsdatum.label" default="Geburtsdatum" /></span>
					
						<span class="property-value" aria-labelledby="geburtsdatum-label"><g:formatDate date="${personInstance?.geburtsdatum}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:personInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${personInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
