

trigger UpdateTruckStatus on Truck_part__c (after update) {
    ObjectStatusUpdate SetToUpdate = new ObjectStatusUpdate();
    for(Truck_part__c obj:Trigger.new){
        System.debug(obj.id);
        System.debug(obj.Status__c);
        System.debug(obj.Truck__c);
      //  System.debug(obj.ComponentName__c);
    SetToUpdate.updateSetStatus(obj.id, obj.Truck__c, obj.Status__c);
    }
}