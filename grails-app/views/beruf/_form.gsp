<%@ page import="de.dhbw.grails.openData.Beruf" %>



<div class="fieldcontain ${hasErrors(bean: berufInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="beruf.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="40" required="" value="${berufInstance?.name}"/>

</div>

