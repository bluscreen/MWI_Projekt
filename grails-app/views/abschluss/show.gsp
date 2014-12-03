
<%@ page import="de.dhbw.grails.openData.Abschluss" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'abschluss.label', default: 'Abschluss')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-abschluss" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-abschluss" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list abschluss">
			
				<g:if test="${abschlussInstance?.bildungseinrichtung}">
				<li class="fieldcontain">
					<span id="bildungseinrichtung-label" class="property-label"><g:message code="abschluss.bildungseinrichtung.label" default="Bildungseinrichtung" /></span>
					
						<span class="property-value" aria-labelledby="bildungseinrichtung-label"><g:link controller="bildungseinrichtung" action="show" id="${abschlussInstance?.bildungseinrichtung?.id}">${abschlussInstance?.bildungseinrichtung?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${abschlussInstance?.abschlussdatum}">
				<li class="fieldcontain">
					<span id="abschlussdatum-label" class="property-label"><g:message code="abschluss.abschlussdatum.label" default="Abschlussdatum" /></span>
					
						<span class="property-value" aria-labelledby="abschlussdatum-label"><g:formatDate date="${abschlussInstance?.abschlussdatum}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${abschlussInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="abschluss.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${abschlussInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${abschlussInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="abschluss.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${abschlussInstance?.person?.id}">${abschlussInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${abschlussInstance?.thema}">
				<li class="fieldcontain">
					<span id="thema-label" class="property-label"><g:message code="abschluss.thema.label" default="Thema" /></span>
					
						<span class="property-value" aria-labelledby="thema-label"><g:fieldValue bean="${abschlussInstance}" field="thema"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${abschlussInstance?.titel}">
				<li class="fieldcontain">
					<span id="titel-label" class="property-label"><g:message code="abschluss.titel.label" default="Titel" /></span>
					
						<span class="property-value" aria-labelledby="titel-label"><g:fieldValue bean="${abschlussInstance}" field="titel"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:abschlussInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${abschlussInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
