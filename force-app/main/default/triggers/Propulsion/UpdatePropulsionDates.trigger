/******************************************************************************
* Author: Vladimir Bessonov
* Date: Aug 30, 2020
* Descpription: Trigger tou update propulsion dates: sent, arrival, accepted, warranty, end of warranty

*/

trigger UpdatePropulsionDates on Propulsion__c(after update) {
  for (Propulsion__c obj : Trigger.new) {
    System.debug('Part ID' + obj.id);
    System.debug('Status of part ' + obj.Status__c);
    //  System.debug(obj.ComponentName__c);
    UpdateDateOnStatusChange.updateDate(obj.id, obj.Status__c);
  }
}
