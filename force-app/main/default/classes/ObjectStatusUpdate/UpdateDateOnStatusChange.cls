/******************************************************************************
* Author: Vladimir Bessonov
* Date: Aug 30, 2020
* Descpription: Class with static methods to update the dates: Sent_date__c, Arrived_date__c, etc. 
in this project used in Trucks, Propulsions, Truck_parts, Propulsion_parts

*/

public with sharing class UpdateDateOnStatusChange {
  public UpdateDateOnStatusChange() {
  }

  public static void updateDate(ID PartID, String NewStatus) {
    System.debug(
      'UpdateDateOnStatusChange.updateDate is called: ID, Status' +
      PartID +
      ' ' +
      NewStatus
    );
    System.debug(Recursion.quoteRecursion);
    if (Recursion.quoteRecursion)
      return;
    Recursion.quoteRecursion = true;

    Schema.SObjectType PartType = PartID.getSObjectType();
    // String ListPartType = 'List<' + PartType + '>';
    System.debug(PartType); // Propulsion_Part__c or Truck_Part__c
    // date to update
    String DateField;
    Date UpdateDate = Date.today();

    SObject Part = (SObject) Type.forName(String.valueOf(PartType))
      .newInstance();
    String qryStringPart =
      'SELECT Id, Sent_Date__c, Arrival_Date__c, Acceptance_Date__c, End_of_Warranty__c FROM ' +
      String.valueOf(PartType) +
      ' WHERE ID ' +
      '=' +
      '\'' +
      PartID +
      '\'';
    system.debug('***********************Build Query == ' + qryStringPart);
    // SObject resultObject = Database.query(qryString);
    Part = Database.query(qryStringPart); // shell return 1 record only
    system.debug('Part :' + Part);

    switch on NewStatus {
      when 'SENT' {
        Part.put('Sent_Date__c', UpdateDate);
        Part.put('Arrival_Date__c', null);
        Part.put('Acceptance_Date__c', null);
        Part.put('End_of_Warranty__c', null);
      }
      when 'ARRIVED' {
        Part.put('Arrival_Date__c', UpdateDate);
        Part.put('Acceptance_Date__c', null);
        Part.put('End_of_Warranty__c', null);
      }
      when 'ACCEPTED/WARRANTY' {
        Part.put('Acceptance_Date__c', UpdateDate);
        Part.put('End_of_Warranty__c', UpdateDate.addMonths(36));
      }
      when 'END OF WARRANTY' {
        Part.put('End_of_Warranty__c', UpdateDate);
      }
    }
    System.debug(
      'PartID, Status, UpdateDate, Part' +
      PartID +
      ' ' +
      NewStatus +
      ' ' +
      UpdateDate +
      ' ' +
      Part
    );
    update Part;
  }
}
