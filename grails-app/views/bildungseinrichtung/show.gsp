
<%@ page import="de.dhbw.grails.openData.Bildungseinrichtung" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bildungseinrichtung.label', default: 'Bildungseinrichtung')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bildungseinrichtung" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bildungseinrichtung" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bildungseinrichtung">
			
				<g:if test="${bildungseinrichtungInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bildungseinrichtung.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bildungseinrichtungInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bildungseinrichtungInstance?.ort}">
				<li class="fieldcontain">
					<span id="ort-label" class="property-label"><g:message code="bildungseinrichtung.ort.label" default="Ort" /></span>
					
						<span class="property-value" aria-labelledby="ort-label"><g:link controller="ort" action="show" id="${bildungseinrichtungInstance?.ort?.id}">${bildungseinrichtungInstance?.ort?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bildungseinrichtungInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="bildungseinrichtung.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${bildungseinrichtungInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bildungseinrichtungInstance?.webpage}">
				<li class="fieldcontain">
					<span id="webpage-label" class="property-label"><g:message code="bildungseinrichtung.webpage.label" default="Webpage" /></span>
					
						<span class="property-value" aria-labelledby="webpage-label"><g:fieldValue bean="${bildungseinrichtungInstance}" field="webpage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bildungseinrichtungInstance?.laengengrad}">
				<li class="fieldcontain">
					<span id="laengengrad-label" class="property-label"><g:message code="bildungseinrichtung.laengengrad.label" default="Laengengrad" /></span>
					
						<span class="property-value" aria-labelledby="laengengrad-label"><g:fieldValue bean="${bildungseinrichtungInstance}" field="laengengrad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bildungseinrichtungInstance?.breitengrad}">
				<li class="fieldcontain">
					<span id="breitengrad-label" class="property-label"><g:message code="bildungseinrichtung.breitengrad.label" default="Breitengrad" /></span>
					
						<span class="property-value" aria-labelledby="breitengrad-label"><g:fieldValue bean="${bildungseinrichtungInstance}" field="breitengrad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bildungseinrichtungInstance?.alumni}">
				<li class="fieldcontain">
					<span id="alumni-label" class="property-label"><g:message code="bildungseinrichtung.alumni.label" default="Alumni" /></span>
					
						<g:each in="${bildungseinrichtungInstance.alumni}" var="a">
						<span class="property-value" aria-labelledby="alumni-label"><g:link controller="person" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bildungseinrichtungInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bildungseinrichtungInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
