<%@ page import="de.dhbw.grails.openData.Ort" %>



<div class="fieldcontain ${hasErrors(bean: ortInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="ort.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="40" required="" value="${ortInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ortInstance, field: 'staat', 'error')} required">
	<label for="staat">
		<g:message code="ort.staat.label" default="Staat" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="staat" name="staat.id" from="${de.dhbw.grails.openData.Staat.list()}" optionKey="id" required="" value="${ortInstance?.staat?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ortInstance, field: 'laengengrad', 'error')} required">
	<label for="laengengrad">
		<g:message code="ort.laengengrad.label" default="Laengengrad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="laengengrad" required="" value="${ortInstance?.laengengrad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ortInstance, field: 'breitengrad', 'error')} required">
	<label for="breitengrad">
		<g:message code="ort.breitengrad.label" default="Breitengrad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="breitengrad" required="" value="${ortInstance?.breitengrad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ortInstance, field: 'postleitzahl', 'error')} ">
	<label for="postleitzahl">
		<g:message code="ort.postleitzahl.label" default="Postleitzahl" />
		
	</label>
	<g:textField name="postleitzahl" value="${ortInstance?.postleitzahl}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ortInstance, field: 'bildungseinrichtungen', 'error')} ">
	<label for="bildungseinrichtungen">
		<g:message code="ort.bildungseinrichtungen.label" default="Bildungseinrichtungen" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ortInstance?.bildungseinrichtungen?}" var="b">
    <li><g:link controller="bildungseinrichtung" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="bildungseinrichtung" action="create" params="['ort.id': ortInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'bildungseinrichtung.label', default: 'Bildungseinrichtung')])}</g:link>
</li>
</ul>


</div>

