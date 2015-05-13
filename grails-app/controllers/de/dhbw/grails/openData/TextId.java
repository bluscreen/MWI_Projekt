package de.dhbw.grails.openData;

public enum TextId {
	TEXTID_State("P17"),
	TEXTID_City("Q515"),
	TEXTID_Person("Q215627"),
	TEXTID_Name("Q82799"),
	TEXTID_Education_Institute("Q2385804"),
	TEXTID_Job("P106"),
	TEXTID_Year_Of_Foundation("P571"),
	TEXTID_Phone("P1329"),
	TEXTID_Alumni("Q508719"),
	TEXTID_Address("P319608"),
	TEXTID_EMail("P968"),
	TEXTID_Description(""), // TODO Define this
	TEXTID_AboutUs(""), // TODO Define this
	TEXTID_Imprint(""), // TODO Define this
	TEXTID_Error("Q29485");
	
	private final String textid;
	
	TextId(String textid){
		this.textid = textid;
	}
	
	public String getTextid() {
		return textid;
	}
}
