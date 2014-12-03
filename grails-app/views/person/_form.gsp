<%@ page import="de.dhbw.grails.openData.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'nachname', 'error')} required">
	<label for="nachname">
		<g:message code="person.nachname.label" default="Nachname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nachname" maxlength="40" required="" value="${personInstance?.nachname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'vorname', 'error')} required">
	<label for="vorname">
		<g:message code="person.vorname.label" default="Vorname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vorname" maxlength="40" required="" value="${personInstance?.vorname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'beruf', 'error')} ">
	<label for="beruf">
		<g:message code="person.beruf.label" default="Beruf" />
		
	</label>
	<g:select id="beruf" name="beruf.id" from="${de.dhbw.grails.openData.Beruf.list()}" optionKey="id" value="${personInstance?.beruf?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'abschluesse', 'error')} ">
	<label for="abschluesse">
		<g:message code="person.abschluesse.label" default="Abschluesse" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.abschluesse?}" var="a">
    <li><g:link controller="abschluss" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="abschluss" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'abschluss.label', default: 'Abschluss')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'geburtsdatum', 'error')} required">
	<label for="geburtsdatum">
		<g:message code="person.geburtsdatum.label" default="Geburtsdatum" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="geburtsdatum" precision="day"  value="${personInstance?.geburtsdatum}"  />

</div>

