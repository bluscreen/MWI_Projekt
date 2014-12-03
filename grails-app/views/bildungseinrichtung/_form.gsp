<%@ page import="de.dhbw.grails.openData.Bildungseinrichtung" %>



<div class="fieldcontain ${hasErrors(bean: bildungseinrichtungInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="bildungseinrichtung.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="40" required="" value="${bildungseinrichtungInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bildungseinrichtungInstance, field: 'ort', 'error')} required">
	<label for="ort">
		<g:message code="bildungseinrichtung.ort.label" default="Ort" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ort" name="ort.id" from="${de.dhbw.grails.openData.Ort.list()}" optionKey="id" required="" value="${bildungseinrichtungInstance?.ort?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bildungseinrichtungInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="bildungseinrichtung.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${bildungseinrichtungInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bildungseinrichtungInstance, field: 'webpage', 'error')} ">
	<label for="webpage">
		<g:message code="bildungseinrichtung.webpage.label" default="Webpage" />
		
	</label>
	<g:field type="url" name="webpage" value="${bildungseinrichtungInstance?.webpage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bildungseinrichtungInstance, field: 'laengengrad', 'error')} ">
	<label for="laengengrad">
		<g:message code="bildungseinrichtung.laengengrad.label" default="Laengengrad" />
		
	</label>
	<g:textField name="laengengrad" value="${bildungseinrichtungInstance?.laengengrad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bildungseinrichtungInstance, field: 'breitengrad', 'error')} ">
	<label for="breitengrad">
		<g:message code="bildungseinrichtung.breitengrad.label" default="Breitengrad" />
		
	</label>
	<g:textField name="breitengrad" value="${bildungseinrichtungInstance?.breitengrad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bildungseinrichtungInstance, field: 'alumni', 'error')} ">
	<label for="alumni">
		<g:message code="bildungseinrichtung.alumni.label" default="Alumni" />
		
	</label>
	<g:select name="alumni" from="${de.dhbw.grails.openData.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${bildungseinrichtungInstance?.alumni*.id}" class="many-to-many"/>

</div>

