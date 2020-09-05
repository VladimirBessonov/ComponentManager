trigger UpdateTruckStatus on Truck_Part__c (after update) {
    ObjectStatusUpdate SetToUpdate = new ObjectStatusUpdate();
    for(Truck_part__c obj:Trigger.new){
        System.debug('Part ID' + obj.id);
        System.debug('Status of part ' + obj.Status__c);
        System.debug('Master Component ' + obj.Truck__c);
      //  System.debug(obj.ComponentName__c);
    SetToUpdate.updateComponentStatus(obj.id, obj.Status__c, obj.Truck__c);

    }
}