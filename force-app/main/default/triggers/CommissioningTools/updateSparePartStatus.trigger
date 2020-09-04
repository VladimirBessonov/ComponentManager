trigger updateSparePartStatus on Commissioning_Equipment__c (after update) {

    for(Commissioning_Equipment__c tool:Trigger.new){
    if(Recursion.quoteRecursion)
    return;
  Recursion.quoteRecursion = true;
        
       CommissioningTool.updateCommissioningToolStatus(tool.id);

    }

}   