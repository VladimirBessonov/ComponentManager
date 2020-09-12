/******************************************************************************
* Author: Vladimir Bessonov
* Date: Aug 30, 2020
* Descpription: Test Class for CommissioningTool

*/
@isTest(SeeAllData=true)
public class CommissioningToolTest {
  @isTest
  static void updateToolStatus() {
    Date TodayDate = Date.today();
    Commissioning_Equipment__c Tool = new Commissioning_Equipment__c(
      Name = 'TEST',
      Type__c = 'TEST',
      Serial_Number__c = '12345678',
      Project__c = 'a3E030000008cFzEAI',
      Calibration_Valid__c = TodayDate
    );
    insert Tool;
    Commissioning_Equipment__c NewTool = [
      SELECT Id, Status__c
      FROM Commissioning_Equipment__c
      WHERE ID = :Tool.ID
    ];
    CommissioningTool.updateCommissioningToolStatus(NewTool.ID);
    System.debug(NewTool);
    String Expected = '< 3 Months to expire';
    String Actual = (String) NewTool.Status__c;
    System.debug(Actual);
    System.assertEquals(Expected, Actual);
  }

  @isTest
  static void updateToolStatusCalibrated() {
    Date TodayDate = Date.today().addMonths(4);
    Commissioning_Equipment__c Tool = new Commissioning_Equipment__c(
      Name = 'TEST',
      Type__c = 'TEST',
      Serial_Number__c = '12345678',
      Project__c = 'a3E030000008cFzEAI',
      Calibration_Valid__c = TodayDate
    );
    insert Tool;
    Commissioning_Equipment__c NewTool = [
      SELECT Id, Status__c
      FROM Commissioning_Equipment__c
      WHERE ID = :Tool.ID
    ];
    CommissioningTool.updateCommissioningToolStatus(NewTool.ID);
    System.debug(NewTool);
    String Expected = 'CALIBRATED';
    String Actual = (String) NewTool.Status__c;
    System.debug(Actual);
    System.assertEquals(Expected, Actual);
  }

  @isTest
  static void updateToolStatusNotCalibrated() {
    Date TodayDate = Date.today().addMonths(-1);
    Commissioning_Equipment__c Tool = new Commissioning_Equipment__c(
      Name = 'TEST',
      Type__c = 'TEST',
      Serial_Number__c = '12345678',
      Project__c = 'a3E030000008cFzEAI',
      Calibration_Valid__c = TodayDate
    );
    insert Tool;
    Commissioning_Equipment__c NewTool = [
      SELECT Id, Status__c
      FROM Commissioning_Equipment__c
      WHERE ID = :Tool.ID
    ];
    CommissioningTool.updateCommissioningToolStatus(NewTool.ID);
    System.debug(NewTool);
    String Expected = 'NOT CALIBRATED';
    String Actual = (String) NewTool.Status__c;
    System.debug(Actual);
    System.assertEquals(Expected, Actual);
  }

  @isTest
  static void updateToolsStatus() {
    Date TodayDate = Date.today();
    // List<Commissioning_Equipment__c> Tools = [SELECT ID FROM Commissioning_Equipment__c];
    // delete Tools;
    Commissioning_Equipment__c Tool = new Commissioning_Equipment__c(
      Name = 'TEST',
      Type__c = 'TEST',
      Serial_Number__c = '12345678',
      Project__c = 'a3E030000008cFzEAI',
      Calibration_Valid__c = TodayDate
    );
    Commissioning_Equipment__c Tool1 = new Commissioning_Equipment__c(
      Name = 'TEST1',
      Type__c = 'TEST1',
      Serial_Number__c = '12345679',
      Project__c = 'a3E030000008cFzEAI',
      Calibration_Valid__c = TodayDate
    );

    insert Tool;
    insert Tool1;
    CommissioningTool.updateCommissioningToolStatus();

    // List<Commissioning_Equipment__c> NewTools = [
    //   SELECT Id, Status__c
    //   FROM Commissioning_Equipment__c
    // ];

    // System.debug('List of Tools available: ' + NewTools);

    Boolean Passed = true;
    String Expected = '< 3 Months to expire';
    // for (Commissioning_Equipment__c eq : NewTools) {
    //   String Actual = (String) eq.Status__c;
    //   if (Expected != Actual) {
    //     Passed = false;
    //   }
    // }

    Commissioning_Equipment__c Toolupdated = [
      SELECT Id, Status__c
      FROM Commissioning_Equipment__c
      WHERE ID = :Tool.ID
    ];
    Commissioning_Equipment__c Toolupdated1 = [
      SELECT Id, Status__c
      FROM Commissioning_Equipment__c
      WHERE ID = :Tool1.ID
    ];

    if ((String) Toolupdated.Status__c != Expected) {
      Passed = false;
    }
    if ((String) Toolupdated1.Status__c != Expected) {
      Passed = false;
    }
    System.assertEquals(Passed, true);
  }

  @isTest
  static void updateToolsStatusCalibrated() {
    Date TodayDate = Date.today().addMonths(4);
    Commissioning_Equipment__c Tool = new Commissioning_Equipment__c(
      Name = 'TEST',
      Type__c = 'TEST',
      Serial_Number__c = '12345678',
      Project__c = 'a3E030000008cFzEAI',
      Calibration_Valid__c = TodayDate
    );
    Commissioning_Equipment__c Tool1 = new Commissioning_Equipment__c(
      Name = 'TEST1',
      Type__c = 'TEST1',
      Serial_Number__c = '12345679',
      Project__c = 'a3E030000008cFzEAI',
      Calibration_Valid__c = TodayDate
    );

    insert Tool;
    insert Tool1;
    CommissioningTool.updateCommissioningToolStatus();
    Boolean Passed = true;
    String Expected = 'CALIBRATED';

    Commissioning_Equipment__c Toolupdated = [
      SELECT Id, Status__c
      FROM Commissioning_Equipment__c
      WHERE ID = :Tool.ID
    ];
    Commissioning_Equipment__c Toolupdated1 = [
      SELECT Id, Status__c
      FROM Commissioning_Equipment__c
      WHERE ID = :Tool1.ID
    ];

    if ((String) Toolupdated.Status__c != Expected) {
      Passed = false;
    }
    if ((String) Toolupdated1.Status__c != Expected) {
      Passed = false;
    }
    System.assertEquals(Passed, true);
  }

  @isTest
  static void updateToolsStatusNotCalibrated() {
    Date TodayDate = Date.today().addMonths(-1);
    Commissioning_Equipment__c Tool = new Commissioning_Equipment__c(
      Name = 'TEST',
      Type__c = 'TEST',
      Serial_Number__c = '12345678',
      Project__c = 'a3E030000008cFzEAI',
      Calibration_Valid__c = TodayDate
    );
    Commissioning_Equipment__c Tool1 = new Commissioning_Equipment__c(
      Name = 'TEST1',
      Type__c = 'TEST1',
      Serial_Number__c = '12345679',
      Project__c = 'a3E030000008cFzEAI',
      Calibration_Valid__c = TodayDate
    );

    insert Tool;
    insert Tool1;
    CommissioningTool.updateCommissioningToolStatus();
    Boolean Passed = true;
    String Expected = 'NOT CALIBRATED';

    Commissioning_Equipment__c Toolupdated = [
      SELECT Id, Status__c
      FROM Commissioning_Equipment__c
      WHERE ID = :Tool.ID
    ];
    Commissioning_Equipment__c Toolupdated1 = [
      SELECT Id, Status__c
      FROM Commissioning_Equipment__c
      WHERE ID = :Tool1.ID
    ];

    if ((String) Toolupdated.Status__c != Expected) {
      Passed = false;
    }
    if ((String) Toolupdated1.Status__c != Expected) {
      Passed = false;
    }
    System.assertEquals(Passed, true);
  }
}
