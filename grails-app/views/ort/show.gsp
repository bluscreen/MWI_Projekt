
<%@ page import="de.dhbw.grails.openData.Ort" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ort.label', default: 'Ort')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ort" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ort" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ort">
			
				<g:if test="${ortInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="ort.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${ortInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ortInstance?.staat}">
				<li class="fieldcontain">
					<span id="staat-label" class="property-label"><g:message code="ort.staat.label" default="Staat" /></span>
					
						<span class="property-value" aria-labelledby="staat-label"><g:link controller="staat" action="show" id="${ortInstance?.staat?.id}">${ortInstance?.staat?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ortInstance?.laengengrad}">
				<li class="fieldcontain">
					<span id="laengengrad-label" class="property-label"><g:message code="ort.laengengrad.label" default="Laengengrad" /></span>
					
						<span class="property-value" aria-labelledby="laengengrad-label"><g:fieldValue bean="${ortInstance}" field="laengengrad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ortInstance?.breitengrad}">
				<li class="fieldcontain">
					<span id="breitengrad-label" class="property-label"><g:message code="ort.breitengrad.label" default="Breitengrad" /></span>
					
						<span class="property-value" aria-labelledby="breitengrad-label"><g:fieldValue bean="${ortInstance}" field="breitengrad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ortInstance?.postleitzahl}">
				<li class="fieldcontain">
					<span id="postleitzahl-label" class="property-label"><g:message code="ort.postleitzahl.label" default="Postleitzahl" /></span>
					
						<span class="property-value" aria-labelledby="postleitzahl-label"><g:fieldValue bean="${ortInstance}" field="postleitzahl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ortInstance?.bildungseinrichtungen}">
				<li class="fieldcontain">
					<span id="bildungseinrichtungen-label" class="property-label"><g:message code="ort.bildungseinrichtungen.label" default="Bildungseinrichtungen" /></span>
					
						<g:each in="${ortInstance.bildungseinrichtungen}" var="b">
						<span class="property-value" aria-labelledby="bildungseinrichtungen-label"><g:link controller="bildungseinrichtung" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:ortInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${ortInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
