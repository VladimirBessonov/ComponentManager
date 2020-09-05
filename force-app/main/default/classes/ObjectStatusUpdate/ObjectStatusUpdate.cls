public class ObjectStatusUpdate {

    public enum Status {NOT_SENT , SENT, ARRIVED, ACCEPTED, AFTERWARRANTY}
    Status ComponentState = Status.NOT_SENT;
    public void updateComponentStatus(ID PartID, String NewStatus, ID ComponentID ) {

        switch on NewStatus {
            when 'SENT' {
                ComponentState = Status.SENT;
            }
            when 'ARRIVED' {
                ComponentState = Status.ARRIVED;
            }
            when 'ACCEPTED/WARRANTY' {
                ComponentState = Status.ACCEPTED;
            }
            when 'AFTER WARRANTY' {
                ComponentState = Status.AFTERWARRANTY;
            }
            when else {
                ComponentState = Status.NOT_SENT;
            }
        }
                // Part type
        Schema.SObjectType PartType = PartID.getSObjectType();
        String ListPartType = 'List<' + PartType + '>';
        System.debug(PartType); // Propulsion_Part__c or Truck_Part__c
        // Comp type 
        Schema.SObjectType CompType = ComponentID.getSObjectType();
        String ListCompType = 'List<' + CompType + '>';
        System.debug(CompType); // Propulsion__c or Truck__c
        
        List<SObject> PartList = (List<SObject>)Type.forName(ListPartType).newInstance();
        String qryStringPartList = 'SELECT Id, Status__c FROM ' + String.valueOf(PartType) + ' WHERE ' + String.valueOf(CompType) + '=' + '\'' + ComponentID + '\'';  
        system.debug('***********************Build Query == ' + qryStringPartList);                  
        // SObject resultObject = Database.query(qryString);
        PartList = Database.query(qryStringPartList); // all parts of Component

        if(PartList.isEmpty() ) { 
            System.debug( 'Part list of prop set shall not be empty: not normal') ; 
        return;
        }

            for(SObject part : PartList) {
            String PartStatus = (String)part.get('Status__c');
            System.debug('PartStatus: '+ PartStatus); 
            
            if (PartStatus != NewStatus && NewStatus != 'NOT SENT')   {
                
                Status tempStatus;
                switch on PartStatus {
                    when 'SENT' {
                        tempStatus = Status.SENT;
                    }
                    when 'ARRIVED' {
                        tempStatus = Status.ARRIVED;
                    }
                    when 'ACCEPTED\'/WARRANTY' {
                        tempStatus = Status.ACCEPTED;
                    }
                    when 'AFTER WARRANTY' {
                        tempStatus = Status.AFTERWARRANTY;
                    }
                    when else {
                        tempStatus = Status.NOT_SENT;
                    }

                }    

                // System.debug('tempStatus Value: ' + tempStatus);
                if (TempStatus.ordinal() < ComponentState.ordinal()) {
                    ComponentState = TempStatus;
                } 
            }
            // can use ComponentState.ordinal() to get string value for update
            switch on ComponentState {
                when SENT {
                    NewStatus = 'SENT';
                }
                when ARRIVED {
                    NewStatus = 'ARRIVED';
                }
                when ACCEPTED {
                    NewStatus = 'ACCEPTED/WARRANTY';
                }
                when AFTERWARRANTY {
                    NewStatus = 'AFTER WARRANTY';
                }
                when else {
                    NewStatus = 'NOT SENT';
                }
            }

            SObject ComponentToUpdate = (SObject)Type.forName(String.valueOf(CompType)).newInstance();
            String qryStringComponentToUpdate = 'SELECT Id, Status__c FROM ' + String.valueOf(CompType) + ' WHERE ID' +  '=' + '\'' + ComponentID + '\'';  
                system.debug('***********************Build Query == ' + qryStringComponentToUpdate);  
                ComponentToUpdate = Database.query(qryStringComponentToUpdate);
           // Propulsion__c ComponentToUpdate = [SELECT ID, Status__c FROM Propulsion__c WHERE ID =: ComponentID];
            ComponentToUpdate.put('Status__c', NewStatus);
                update ComponentToUpdate;

        

            
            // else {            Propulsion__c ComponentToUpdate = [SELECT ID, Status__c FROM Propulsion__c WHERE ID =: ComponentID];
            //     ComponentToUpdate.Status__c = NewStatus;
            //     update ComponentToUpdate; 
            // }


        }

    }
}