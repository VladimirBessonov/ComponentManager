
/******************************************************************************
* Author: Vladimir Bessonov
* Date: Aug 30, 2020
* Descpription: Trigger to populate newly created Propulsion set in project with parts

*/


trigger NewPropSet on Propulsion__c (after insert) {
      System.debug('NewPropSet Trigger ');
     for(Propulsion__c Comp:Trigger.new){
        // after Comp set is created, it is automatically populated with predefined set of parts, that is recieved from MAP 
        // String ProjectName, String ObjectName, ID ObjectID, CreateObjectData ObjData
        List<Project__c> Projects = [SELECT ID, Name FROM Project__c WHERE ID = : Comp.Project__c LIMIT 1];
        String ProjectName = Projects[0].Name;
        ID MasterComponentID = Comp.id; // ID of the Component where parts will be added
        String ObjectName = Comp.ComponentName__c; // change to Component Name
        System.debug('Comp: ' + Comp);
        Project project = ProjectMap.Projects.get(ProjectName);
        System.debug('Project Name ' + ProjectName);
        System.debug('Project ' + project);
        System.debug('ObjectName ' + ObjectName);
         for (CreateObjectData component : project.ComponentList ){
             try {
                if (component.Name == ObjectName) {
                  System.debug('Component Name ' + component.Name);
                  System.debug('Component Name ' + component);
                    ICreateObjectForProject helper = New ObjectCreationFactory().getObjectRequest(ProjectName, ObjectName,  MasterComponentID, component);
                    helper.createObjectRequest(ProjectName, ObjectName,  MasterComponentID, component);
                    System.debug('Create Object requested:' + ProjectName + ' ' + ObjectName + ' ' + MasterComponentID);
                }
             } 
             catch (Exception e) {
                System.debug('An exception occurred: ' + e.getMessage());
             }
           
        }

     }
}
