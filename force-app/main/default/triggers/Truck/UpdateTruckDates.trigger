/******************************************************************************
* Author: Vladimir Bessonov
* Date: Aug 30, 2020
* Descpription: Trigger to update Propulsion status SENT, ARRIVED, ACCEPTED/WARRANTY, END OF WARRANTY

*/

trigger UpdateTruckDates on Truck__c(after update) {
  for (Truck__c obj : Trigger.new) {
    System.debug('Truck ID' + obj.id);
    System.debug('Status of Truck ' + obj.Status__c);
    //  System.debug(obj.ComponentName__c);
    UpdateDateOnStatusChange.updateDate(obj.id, obj.Status__c);
  }
}
