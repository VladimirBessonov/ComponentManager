/******************************************************************************
* Author: Vladimir Bessonov
* Date: Aug 30, 2020
* Descpription: Update the whole set status based on part status. If one part is still not sent,
the whole set is NOT SENT.

*/

public class ObjectStatusUpdate {
    public ObjectStatusUpdate() {
        
    }
    
    public enum Status {NOT_SENT , SENT, ARRIVED, ACCEPTED, AFTERWARRANTY}
    Status propSetState = Status.NOT_SENT;

    public void updateSetStatus(ID PropPartID, ID PropID, String NewStatus, String ComponentName) {


        switch on NewStatus {
            when 'SENT' {
                propSetState = Status.SENT;
            }
            when 'ARRIVED' {
                propSetState = Status.ARRIVED;
            }
            when 'ACCEPTED/WARRANTY' {
                propSetState = Status.ACCEPTED;
            }
            when 'AFTER WARRANTY' {
                propSetState = Status.AFTERWARRANTY;
            }
            when else {
                propSetState = Status.NOT_SENT;
            }
        }
            Schema.SObjectType targetType = Schema.getGlobalDescribe().get(ComponentName);
            String listType = 'List<' + targetType + '>';
            List<SObject> PartList = (List<SObject>)Type.forName(listType).newInstance();


       // List<Propulsion_part__c> PartList = New List<Propulsion_part__c>();
        PartList = [ SELECT ID, Status__c FROM Propulsion_part__c WHERE Propulsion__c =: PropID]; // 

        if(PartList.isEmpty() ) { 
            System.debug( 'Part list of prop set shall not be empty: not normal') ; 
           return;
        }
        // add ENUM in case the status of part was changed back to SENT from ARRIVED for Example 
        for (Propulsion_part__c part : PartList) {
        if (part.Status__c != NewStatus && NewStatus != 'NOT SENT')
            {
                Status tempStatus;
                switch on part.Status__c {
                    when 'SENT' {
                        tempStatus = Status.SENT;
                    }
                    when 'ARRIVED' {
                        tempStatus = Status.ARRIVED;
                    }
                    when 'ACCEPTED/WARRANTY' {
                        tempStatus = Status.ACCEPTED;
                    }
                    when 'AFTER WARRANTY' {
                        tempStatus = Status.AFTERWARRANTY;
                    }
                    when else {
                        tempStatus = Status.NOT_SENT;
                    }
                }


                System.debug('tempStatus Value');
                System.debug(tempStatus);
            // Status TempStatus = Status.valueOf(part.Status_list__c);
           // propSetState = Status.valueOf(NewStatus);
           // System.debug(propSetState);
           // System.debug(TempStatus);
            if (TempStatus.ordinal() < propSetState.ordinal()) {
                propSetState = TempStatus;
            } 
            // else {
            //     propSetState = Status.valueOf(NewStatus);
            // }
            // propSetState = Status.values()[propSetState.ordinal() - 1];  //[propSetState.ordinal() - 1];?
            switch on propSetState {
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
            Propulsion__c PropSetToUpdate = [SELECT ID, Status__c FROM Propulsion__c WHERE ID =: PropID];
                PropSetToUpdate.Status__c = NewStatus;
                update PropSetToUpdate;

            return;
            } else {            Propulsion__c PropSetToUpdate = [SELECT ID, Status__c FROM Propulsion__c WHERE ID =: PropID];
                PropSetToUpdate.Status__c = NewStatus;
                update PropSetToUpdate; 
            }


        }
    }
}