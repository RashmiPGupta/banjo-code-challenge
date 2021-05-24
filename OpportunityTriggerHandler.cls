public class OpportunityTriggerHandler {

 public static void createRenewalOpp(List<opportunity> oppList) {
 
     // Create a List to store all renewal opps for bulk inserting
     List<Opportunity> renewOppsList = new List<Opportunity>();
     
     Id oppRecTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('renewal').getRecordTypeId();
 
     for (Opportunity opp : oppList) {
     // Only create renewal opps for closed won deals
         if (opp.StageName.equals( 'Closed Won')) {
         
             Opportunity renewOpp = new Opportunity();
             renewOpp.AccountId = opp.AccountId;
             renewOpp.Name = opp.Name + ' Renewal Opportunity';
             renewOpp.CloseDate = opp.CloseDate.addYears(1);
             renewOpp.StageName = 'Open';
             renewOpp.RecordTypeId = oppRecTypeId;
             renewOpp.OwnerId = opp.OwnerId;
             renewOppsList.add(renewOpp);
             }
         }
     // Bulk insert all renewals to avoid Governor Limits
     insert renewOppsList;

 }
}
