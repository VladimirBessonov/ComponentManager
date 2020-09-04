global class updateToolsStatus implements Schedulable {
    global void execute(SchedulableContext sc)
    {
        CommissioningTool.updateCommissioningToolStatus();
    }

}
