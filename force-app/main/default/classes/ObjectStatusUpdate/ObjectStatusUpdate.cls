public class ObjectStatusUpdate {
    public ObjectStatusUpdate() {
        
    }

    public IObjectUpdate requestStatusUpdate(ID PropPartID, ID PropID, String NewStatus) {
        IObjectUpdate requestObject;
        if(string.isNotBlank(NewStatus) && string.isNotBlank(PropPartID) && string.isNotBlank(PropID))  {
            Schema.SObjectType targetType = PropID.getSObjectType();
            String ComponentType = String.valueOf(targetType);
            switch on ComponentType
            {
                when 'Propulsion__c'
                {   
                    System.debug('Update Propulsion state:');
                    requestObject=new UpdatePropulsionStatus();
                }
                when 'Truck__c'
                {   System.debug('Update Truck state:');
                    requestObject=new UpdatePropulsionStatus(); // still need to implenent Truck objectcreation
                }
                when else
                {
                    throw new BaseException('Service Type is not valid');
                }
            }
            return requestObject;
        }
       	throw new BaseException('Service Type not provided');
    }

}