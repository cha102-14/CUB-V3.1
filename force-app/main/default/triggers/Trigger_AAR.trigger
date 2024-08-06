trigger Trigger_AAR on FinServ__AccountAccountRelation__c(before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    if(Trigger.isBefore && Trigger.isInsert) {
        AARTriggerHandler.uiCreateAddExternalId(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        // AAR record which is user created or dataoader import
        if(Trigger.new[0].FinServ__InverseRelationship__c == null) {
            System.debug([SELECT Id FROM FinServ__AccountAccountRelation__c WHERE FinServ__InverseRelationship__c = :Trigger.new[0].Id]);
        }
    }
    if(Trigger.isBefore && Trigger.isUpdate) {
        AARTriggerHandler.setInverseRelationship(Trigger.oldMap, Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate) {
    }
}