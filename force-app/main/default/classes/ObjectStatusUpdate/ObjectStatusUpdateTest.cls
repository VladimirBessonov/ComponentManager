/******************************************************************************
* Author: Vladimir Bessonov
* Date: Sep 10, 2020
* Descpription: Test Class for ObjectStatusUpdate - after each part of component is udpated to new status, 
status of component is changed

*/

@isTest(SeeAllData=true)
public with sharing class ObjectStatusUpdateTest {
  @isTest
  static void updateStatusSent() {
    Date TodayDate = Date.today();
    Truck__c Comp = new Truck__c(
      Name = 'testset',
      Project__c = 'a3E030000008cFzEAI',
      Status__c = 'NOT SENT'
    );

    insert Comp;

    List<Truck_Part__c> Parts = [
      SELECT ID, Status__c, Name
      FROM Truck_Part__c
      WHERE Truck__c = :Comp.id FOR UPDATE
    ];
    System.debug('Comp: ' + Comp);
    System.debug('Parts ' + Parts);
    for (Truck_Part__c part : Parts) {
      part.Status__c = 'SENT';
    }
    System.debug('UPDATE PARTS');
    update Parts;
    String ExpectedStatus = 'SENT';

    Truck__c CompUpdated = [
      SELECT ID, Status__c, Name
      FROM Truck__c
      WHERE ID = :Comp.id FOR UPDATE
    ];
    System.debug(CompUpdated.Status__c);
    System.debug('Comp: ' + CompUpdated); // ?
    System.assertEquals(ExpectedStatus, CompUpdated.Status__c);
  }

  @isTest
  static void updateStatusArrived() {
    Date TodayDate = Date.today();
    Truck__c Comp = new Truck__c(
      Name = 'testset',
      Project__c = 'a3E030000008cFzEAI',
      Status__c = 'NOT SENT'
    );

    insert Comp;

    List<Truck_Part__c> Parts = [
      SELECT ID, Status__c, Name
      FROM Truck_Part__c
      WHERE Truck__c = :Comp.id FOR UPDATE
    ];
    System.debug('Comp: ' + Comp);
    System.debug('Parts ' + Parts);
    for (Truck_Part__c part : Parts) {
      part.Status__c = 'ARRIVED';
    }
    System.debug('UPDATE PARTS');
    update Parts;
    String ExpectedStatus = 'ARRIVED';

    Truck__c CompUpdated = [
      SELECT ID, Status__c, Name
      FROM Truck__c
      WHERE ID = :Comp.id FOR UPDATE
    ];
    System.debug(CompUpdated.Status__c);
    System.debug('Comp: ' + CompUpdated); // ?
    System.assertEquals(ExpectedStatus, CompUpdated.Status__c);
  }

  @isTest
  static void updateStatusAccepted() {
    Date TodayDate = Date.today();
    Truck__c Comp = new Truck__c(
      Name = 'testset',
      Project__c = 'a3E030000008cFzEAI',
      Status__c = 'NOT SENT'
    );

    insert Comp;

    List<Truck_Part__c> Parts = [
      SELECT ID, Status__c, Name
      FROM Truck_Part__c
      WHERE Truck__c = :Comp.id FOR UPDATE
    ];
    System.debug('Comp: ' + Comp);
    System.debug('Parts ' + Parts);
    for (Truck_Part__c part : Parts) {
      part.Status__c = 'ACCEPTED/WARRANTY';
    }
    System.debug('UPDATE PARTS');
    update Parts;
    String ExpectedStatus = 'ACCEPTED/WARRANTY';

    Truck__c CompUpdated = [
      SELECT ID, Status__c, Name
      FROM Truck__c
      WHERE ID = :Comp.id FOR UPDATE
    ];
    System.debug('Comp: ' + CompUpdated);
    System.assertEquals(ExpectedStatus, CompUpdated.Status__c);
  }

  @isTest
  static void updateStatusEndOfWarranty() {
    Date TodayDate = Date.today();
    Truck__c Comp = new Truck__c(
      Name = 'testset',
      Project__c = 'a3E030000008cFzEAI',
      Status__c = 'NOT SENT'
    );

    insert Comp;

    List<Truck_Part__c> Parts = [
      SELECT ID, Status__c, Name
      FROM Truck_Part__c
      WHERE Truck__c = :Comp.id FOR UPDATE
    ];
    System.debug('Comp: ' + Comp);
    System.debug('Parts ' + Parts);
    for (Truck_Part__c part : Parts) {
      part.Status__c = 'END OF WARRANTY';
    }
    System.debug('UPDATE PARTS');
    update Parts;
    String ExpectedStatus = 'END OF WARRANTY';

    Truck__c CompUpdated = [
      SELECT ID, Status__c, Name
      FROM Truck__c
      WHERE ID = :Comp.id FOR UPDATE
    ];
    System.debug(CompUpdated.Status__c);
    System.debug('Comp: ' + CompUpdated);
    System.assertEquals(ExpectedStatus, CompUpdated.Status__c);
  }

  @isTest
  static void updateStatusPropSent() {
    Date TodayDate = Date.today();
    Propulsion__c Comp = new Propulsion__c(
      Name = 'testset',
      Project__c = 'a3E030000008cFzEAI',
      Status__c = 'NOT SENT'
    );

    insert Comp;

    List<Propulsion_Part__c> Parts = [
      SELECT ID, Status__c, Name
      FROM Propulsion_Part__c
      WHERE Propulsion__c = :Comp.id FOR UPDATE
    ];
    System.debug('Comp: ' + Comp);
    System.debug('Parts ' + Parts);
    for (Propulsion_Part__c part : Parts) {
      part.Status__c = 'SENT';
    }
    System.debug('UPDATE PARTS');
    update Parts;

    String ExpectedStatus = 'SENT';

    Propulsion__c CompUpdated = [
      SELECT ID, Status__c, Name
      FROM Propulsion__c
      WHERE ID = :Comp.id FOR UPDATE
    ];
    System.debug(CompUpdated.Status__c);
    System.debug('Comp: ' + CompUpdated); // ?
    System.assertEquals(ExpectedStatus, CompUpdated.Status__c);
  }

  @isTest
  static void updateStatusPropArrived() {
    Date TodayDate = Date.today();
    Propulsion__c Comp = new Propulsion__c(
      Name = 'testset',
      Project__c = 'a3E030000008cFzEAI',
      Status__c = 'NOT SENT'
    );

    insert Comp;

    List<Propulsion_Part__c> Parts = [
      SELECT ID, Status__c, Name
      FROM Propulsion_Part__c
      WHERE Propulsion__c = :Comp.id FOR UPDATE
    ];
    System.debug('Comp: ' + Comp);
    System.debug('Parts ' + Parts);
    for (Propulsion_Part__c part : Parts) {
      part.Status__c = 'ARRIVED';
    }
    System.debug('UPDATE PARTS');
    update Parts;

    String ExpectedStatus = 'ARRIVED';

    Propulsion__c CompUpdated = [
      SELECT ID, Status__c, Name
      FROM Propulsion__c
      WHERE ID = :Comp.id FOR UPDATE
    ];
    System.debug(CompUpdated.Status__c);
    System.debug('Comp: ' + CompUpdated);
    System.assertEquals(ExpectedStatus, CompUpdated.Status__c);
  }

  @isTest
  static void updateStatusPropAccepted() {
    Date TodayDate = Date.today();
    Propulsion__c Comp = new Propulsion__c(
      Name = 'testset',
      Project__c = 'a3E030000008cFzEAI',
      Status__c = 'NOT SENT'
    );

    insert Comp;

    List<Propulsion_Part__c> Parts = [
      SELECT ID, Status__c, Name
      FROM Propulsion_Part__c
      WHERE Propulsion__c = :Comp.id FOR UPDATE
    ];
    System.debug('Comp: ' + Comp);
    System.debug('Parts ' + Parts);
    for (Propulsion_Part__c part : Parts) {
      part.Status__c = 'ACCEPTED/WARRANTY';
    }
    System.debug('UPDATE PARTS');
    update Parts;
    String ExpectedStatus = 'ACCEPTED/WARRANTY';

    Propulsion__c CompUpdated = [
      SELECT ID, Status__c, Name
      FROM Propulsion__c
      WHERE ID = :Comp.id FOR UPDATE
    ];
    System.debug(CompUpdated.Status__c);
    System.debug('Comp: ' + CompUpdated);
    System.assertEquals(ExpectedStatus, CompUpdated.Status__c);
  }

  @isTest
  static void updateStatusPropEndOfWarranty() {
    Date TodayDate = Date.today();
    Propulsion__c Comp = new Propulsion__c(
      Name = 'testset',
      Project__c = 'a3E030000008cFzEAI',
      Status__c = 'NOT SENT'
    );

    insert Comp;

    List<Propulsion_Part__c> Parts = [
      SELECT ID, Status__c, Name
      FROM Propulsion_Part__c
      WHERE Propulsion__c = :Comp.id FOR UPDATE
    ];
    System.debug('Comp: ' + Comp);
    System.debug('Parts ' + Parts);
    for (Propulsion_Part__c part : Parts) {
      part.Status__c = 'END OF WARRANTY';
    }
    System.debug('UPDATE PARTS');
    update Parts;
    String ExpectedStatus = 'END OF WARRANTY';

    Propulsion__c CompUpdated = [
      SELECT ID, Status__c, Name
      FROM Propulsion__c
      WHERE ID = :Comp.id FOR UPDATE
    ];
    System.debug(CompUpdated.Status__c);
    System.debug('Comp: ' + CompUpdated); // ?
    System.assertEquals(ExpectedStatus, CompUpdated.Status__c);
  }
}
