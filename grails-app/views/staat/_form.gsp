<%@ page import="de.dhbw.grails.openData.Staat" %>



<div class="fieldcontain ${hasErrors(bean: staatInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="staat.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="40" required="" value="${staatInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staatInstance, field: 'laengengrad', 'error')} required">
	<label for="laengengrad">
		<g:message code="staat.laengengrad.label" default="Laengengrad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="laengengrad" required="" value="${staatInstance?.laengengrad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staatInstance, field: 'breitengrad', 'error')} required">
	<label for="breitengrad">
		<g:message code="staat.breitengrad.label" default="Breitengrad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="breitengrad" required="" value="${staatInstance?.breitengrad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staatInstance, field: 'language', 'error')} ">
	<label for="language">
		<g:message code="staat.language.label" default="Language" />
		
	</label>
	<g:textField name="language" value="${staatInstance?.language}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staatInstance, field: 'orte', 'error')} ">
	<label for="orte">
		<g:message code="staat.orte.label" default="Orte" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${staatInstance?.orte?}" var="o">
    <li><g:link controller="ort" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ort" action="create" params="['staat.id': staatInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ort.label', default: 'Ort')])}</g:link>
</li>
</ul>


</div>

