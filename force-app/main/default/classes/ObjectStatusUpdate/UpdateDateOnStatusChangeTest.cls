/******************************************************************************
* Author: Vladimir Bessonov
* Date: Sep 23, 2020
* Descpription: Test Class for UpdateDateOnStatusChange

*/

@isTest(SeeAllData=true)
public with sharing class UpdateDateOnStatusChangeTest {

@isTest
static void TruckUpdateDateSent() {
    // Create Component
    Date TodayDate = Date.today();
    Truck__c Truck = new Truck__c(
        Name = 'testSet',
        Project__c = 'a3E030000008cFzEAI'
      );
    insert Truck;
    Truck__c TruckCreated = [Select ID FROM Truck__c WHERE ID =: Truck.id FOR UPDATE];
    Truck_Part__c TruckPart = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
    FROM Truck_Part__c WHERE Truck__c =: TruckCreated.ID LIMIT  1 FOR UPDATE];
    
    String Status = 'SENT';
    TruckPart.Status__c = Status;

    update TruckPart;

    Truck_Part__c TruckPartUpdared = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
    FROM Truck_Part__c WHERE ID =: TruckPart.ID FOR UPDATE];

    System.debug(TruckPartUpdared);
    
    Boolean Pass = False;
        
    if (TruckPartUpdared.Sent_Date__c == TodayDate && TruckPartUpdared.Arrival_Date__c == null 
        && TruckPartUpdared.Acceptance_Date__c == null && TruckPartUpdared.End_of_Warranty__c == null) {
            Pass = True;
        }
    System.assertEquals(True, Pass);
}

@isTest
static void TruckUpdateDateArrived() {

    Date TodayDate = Date.today();
    Truck__c Truck = new Truck__c(
        Name = 'testSet',
        Project__c = 'a3E030000008cFzEAI'
      );
    insert Truck;
    Truck__c TruckCreated = [Select ID FROM Truck__c WHERE ID =: Truck.id FOR UPDATE];
    Truck_Part__c TruckPart = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
    FROM Truck_Part__c WHERE Truck__c =: TruckCreated.ID LIMIT  1 FOR UPDATE];
    
    String Status = 'ARRIVED';
    TruckPart.Status__c = Status;

    update TruckPart;

    Truck_Part__c TruckPartUpdared = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
    FROM Truck_Part__c WHERE ID =: TruckPart.ID FOR UPDATE];

    System.debug(TruckPartUpdared);
    
    Boolean Pass = False;
        
    if ( TruckPartUpdared.Arrival_Date__c == TodayDate && TruckPartUpdared.Acceptance_Date__c == null && TruckPartUpdared.End_of_Warranty__c == null) {
            Pass = True;
        }
    System.assertEquals(True, Pass);
    }

    @isTest
    static void TruckUpdateDateAccepted() {
    
        Date TodayDate = Date.today();
        Truck__c Truck = new Truck__c(
            Name = 'testSet',
            Project__c = 'a3E030000008cFzEAI'
          );
        insert Truck;
        Truck__c TruckCreated = [Select ID FROM Truck__c WHERE ID =: Truck.id];
        Truck_Part__c TruckPart = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
        FROM Truck_Part__c WHERE Truck__c =: TruckCreated.ID LIMIT  1 FOR UPDATE];
        
        String Status = 'ACCEPTED/WARRANTY';
        TruckPart.Status__c = Status;
    
        update TruckPart;
    
        Truck_Part__c TruckPartUpdared = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
        FROM Truck_Part__c WHERE ID =: TruckPart.ID FOR UPDATE];
    
        System.debug(TruckPartUpdared);
        System.debug(TruckPartUpdared.Acceptance_Date__c);
        System.debug(TruckPartUpdared.End_of_Warranty__c);
        Boolean Pass = False;
            
        if (TruckPartUpdared.Acceptance_Date__c == TodayDate 
        && TruckPartUpdared.End_of_Warranty__c == TodayDate.addMonths(36)
        ) {
                Pass = True;
            }
        System.assertEquals(True, Pass);
        }

        @isTest
        static void PropUpdateDateSent() {
            // Create Component
            Date TodayDate = Date.today();
            Propulsion__c Prop = new Propulsion__c(
                Name = 'testSet',
                Project__c = 'a3E030000008cFzEAI'
              );
            insert Prop;
            Propulsion__c PropCreated = [Select ID FROM Propulsion__c WHERE ID =: Prop.id FOR UPDATE];
            Propulsion_Part__c PropPart = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
            FROM Propulsion_Part__c WHERE Propulsion__c =: PropCreated.ID LIMIT  1 FOR UPDATE];
            
            String Status = 'SENT';
            PropPart.Status__c = Status;
        
            update PropPart;
        
            Propulsion_Part__c PropPartUpdated = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
            FROM Propulsion_Part__c WHERE ID =: PropPart.ID FOR UPDATE];
        
            System.debug(PropPartUpdated);
            
            Boolean Pass = False;
                
            if (PropPartUpdated.Sent_Date__c == TodayDate && PropPartUpdated.Arrival_Date__c == null 
                && PropPartUpdated.Acceptance_Date__c == null && PropPartUpdated.End_of_Warranty__c == null) {
                    Pass = True;
                }
            System.assertEquals(True, Pass);
        }

        @isTest
        static void PropUpdateDateArrived() {
            // Create Component
            Date TodayDate = Date.today();
            Propulsion__c Prop = new Propulsion__c(
                Name = 'testSet',
                Project__c = 'a3E030000008cFzEAI'
              );
            insert Prop;
            Propulsion__c PropCreated = [Select ID FROM Propulsion__c WHERE ID =: Prop.id FOR UPDATE];
            Propulsion_Part__c PropPart = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
            FROM Propulsion_Part__c WHERE Propulsion__c =: PropCreated.ID LIMIT  1 FOR UPDATE];
            
            String Status = 'ARRIVED';
            PropPart.Status__c = Status;
        
            update PropPart;
        
            Propulsion_Part__c PropPartUpdated = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
            FROM Propulsion_Part__c WHERE ID =: PropPart.ID FOR UPDATE];
        
            System.debug(PropPartUpdated);
            
            Boolean Pass = False;
                
            if (PropPartUpdated.Arrival_Date__c == TodayDate 
                && PropPartUpdated.Acceptance_Date__c == null && PropPartUpdated.End_of_Warranty__c == null) {
                    Pass = True;
                }
            System.assertEquals(True, Pass);
        }

        @isTest
        static void PropUpdateDateAccepted() {
            // Create Component
            Date TodayDate = Date.today();
            Propulsion__c Prop = new Propulsion__c(
                Name = 'testSet',
                Project__c = 'a3E030000008cFzEAI'
              );
            insert Prop;
            Propulsion__c PropCreated = [Select ID FROM Propulsion__c WHERE ID =: Prop.id FOR UPDATE];
            Propulsion_Part__c PropPart = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
            FROM Propulsion_Part__c WHERE Propulsion__c =: PropCreated.ID LIMIT  1 FOR UPDATE];
            
            String Status = 'ACCEPTED/WARRANTY';
            PropPart.Status__c = Status;
        
            update PropPart;
        
            Propulsion_Part__c PropPartUpdated = [Select Name, ID, Status__c, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c 
            FROM Propulsion_Part__c WHERE ID =: PropPart.ID FOR UPDATE];
        
            System.debug(PropPartUpdated);
            
            Boolean Pass = False;
                
            if (PropPartUpdated.Acceptance_Date__c == TodayDate && PropPartUpdated.End_of_Warranty__c == TodayDate.addMonths(36)) {
                    Pass = True;
                }
            System.assertEquals(True, Pass);
        }
        



}
