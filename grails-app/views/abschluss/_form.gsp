<%@ page import="de.dhbw.grails.openData.Abschluss" %>



<div class="fieldcontain ${hasErrors(bean: abschlussInstance, field: 'bildungseinrichtung', 'error')} required">
	<label for="bildungseinrichtung">
		<g:message code="abschluss.bildungseinrichtung.label" default="Bildungseinrichtung" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bildungseinrichtung" name="bildungseinrichtung.id" from="${de.dhbw.grails.openData.Bildungseinrichtung.list()}" optionKey="id" required="" value="${abschlussInstance?.bildungseinrichtung?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: abschlussInstance, field: 'abschlussdatum', 'error')} required">
	<label for="abschlussdatum">
		<g:message code="abschluss.abschlussdatum.label" default="Abschlussdatum" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="abschlussdatum" precision="day"  value="${abschlussInstance?.abschlussdatum}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: abschlussInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="abschluss.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="note" required="" value="${abschlussInstance?.note}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: abschlussInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="abschluss.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${de.dhbw.grails.openData.Person.list()}" optionKey="id" required="" value="${abschlussInstance?.person?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: abschlussInstance, field: 'thema', 'error')} required">
	<label for="thema">
		<g:message code="abschluss.thema.label" default="Thema" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="thema" required="" value="${abschlussInstance?.thema}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: abschlussInstance, field: 'titel', 'error')} required">
	<label for="titel">
		<g:message code="abschluss.titel.label" default="Titel" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titel" required="" value="${abschlussInstance?.titel}"/>

</div>

