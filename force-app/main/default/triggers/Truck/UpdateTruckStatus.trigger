

trigger UpdateTruckStatus on Truck_part__c (after update) {
    ObjectStatusUpdate propSetToUpdate = new ObjectStatusUpdate();
    for(Truck_part__c obj:Trigger.new){
        System.debug(obj.id);
        System.debug(obj.Status__c);
        System.debug(obj.Propulsion__c);
        System.debug(obj.ComponentName__c);
    propSetToUpdate.updateSetStatus(obj.id, obj.Propulsion__c, obj.Status__c, obj.ComponentName__c);
    }
}