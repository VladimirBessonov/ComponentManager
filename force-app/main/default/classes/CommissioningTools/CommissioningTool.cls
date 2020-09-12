/******************************************************************************
* Author: Vladimir Bessonov
* Date: Aug 30, 2020
* Descpription: Update Commissioning Tool status when Calibration_Valid__c is changed

*/
public without sharing class CommissioningTool {
  public CommissioningTool() {
  }

  public static void updateCommissioningToolStatus(ID toolID) {
    List<Commissioning_Equipment__c> ToolList = [
      SELECT ID, Name, Calibration_Valid__c, Status__c
      FROM Commissioning_Equipment__c
      WHERE ID = :toolID
      LIMIT 1
    ]; //
    System.debug(ToolList);
    string State = 'NOT CALIBRATED';
    Date Calibration = ToolList[0].Calibration_Valid__c;
    Date today = System.today();

    if (today <= Calibration && today.daysBetween(Calibration) > 90) {
      State = 'CALIBRATED';
    }

    if (today <= Calibration && today.daysBetween(Calibration) < 90) {
      State = '< 3 months to expire';
    }
    ToolList[0].Status__c = State;
    update ToolList;
  }

  public static void updateCommissioningToolStatus() {
    List<Commissioning_Equipment__c> ToolList = [
      SELECT
        ID,
        Name,
        Calibration_Valid__c,
        Status__c,
        Serial_Number__c,
        Project__c,
        CreatedById
      FROM Commissioning_Equipment__c
    ]; //
    Date today = System.today();

    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    List<ID> ownerids = new List<ID>();
    List<String> sendTo = new List<String>();
    List<User> users = new List<User>();

    for (Commissioning_Equipment__c tool : ToolList) {
      string State = 'NOT CALIBRATED';
      Date Calibration = tool.Calibration_Valid__c;
      if (today <= Calibration && today.daysBetween(Calibration) > 90) {
        State = 'CALIBRATED';
      }

      if (today <= Calibration && today.daysBetween(Calibration) < 90) {
        State = '< 3 months to expire';
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        string body =
          'The tool will be out of calibration soon: ' +
          tool.Name +
          ' - ' +
          tool.Serial_Number__c +
          ' </b> Project <p>' +
          +tool.Project__c +
          '<a> Best Regards </a>';
        mail.setHtmlBody(body);
        mail.setSubject(
          'Calibration needed:' +
          tool.Name +
          ' - ' +
          tool.Serial_Number__c
        );
        ownerids.add(tool.CreatedById);
        mail.setTargetObjectId(tool.CreatedById);
        mail.setSaveAsActivity(false);
        mails.add(mail);
      }
      tool.Status__c = State;
    }

    if (ownerids.size() > 0) {
      Messaging.sendEmail(mails);
    }
    update ToolList;
  }
}
