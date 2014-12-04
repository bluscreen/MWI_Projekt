
<%@ page import="de.dhbw.grails.openData.Staat" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'staat.label', default: 'Staat')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-staat" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-staat" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list staat">
			
				<g:if test="${staatInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="staat.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${staatInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staatInstance?.laengengrad}">
				<li class="fieldcontain">
					<span id="laengengrad-label" class="property-label"><g:message code="staat.laengengrad.label" default="Laengengrad" /></span>
					
						<span class="property-value" aria-labelledby="laengengrad-label"><g:fieldValue bean="${staatInstance}" field="laengengrad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staatInstance?.breitengrad}">
				<li class="fieldcontain">
					<span id="breitengrad-label" class="property-label"><g:message code="staat.breitengrad.label" default="Breitengrad" /></span>
					
						<span class="property-value" aria-labelledby="breitengrad-label"><g:fieldValue bean="${staatInstance}" field="breitengrad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staatInstance?.language}">
				<li class="fieldcontain">
					<span id="language-label" class="property-label"><g:message code="staat.language.label" default="Language" /></span>
					
						<span class="property-value" aria-labelledby="language-label"><g:fieldValue bean="${staatInstance}" field="language"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staatInstance?.orte}">
				<li class="fieldcontain">
					<span id="orte-label" class="property-label"><g:message code="staat.orte.label" default="Orte" /></span>
					
						<g:each in="${staatInstance.orte}" var="o">
						<span class="property-value" aria-labelledby="orte-label"><g:link controller="ort" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:staatInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${staatInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
