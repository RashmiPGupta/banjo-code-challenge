trigger CreateRenewalTrigger on Opportunity (before update) {

 if(trigger.isBefore) {
     if(trigger.isUpdate) {
 
     OpportunityTriggerHandler.createRenewalOpp(Trigger.new);
 
  }
 }
}
