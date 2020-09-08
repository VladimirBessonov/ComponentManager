trigger UpdatePropulsionStatus on Propulsion_Part__c (after update) {
    ObjectStatusUpdate SetToUpdate = new ObjectStatusUpdate();
    for(Propulsion_Part__c obj:Trigger.new){
        System.debug('Part ID' + obj.id);
        System.debug('Status of part ' + obj.Status__c);
        System.debug('Master Component ' + obj.Propulsion__c);
      //  System.debug(obj.ComponentName__c);
    UpdateDateOnStatusChange.updateDate(obj.id, obj.Status__c);
    SetToUpdate.updateComponentStatus(obj.id, obj.Status__c, obj.Propulsion__c);

    }
}