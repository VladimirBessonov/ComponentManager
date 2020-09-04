/******************************************************************************
* Author: Vladimir Bessonov
* Date: Aug 30, 2020
* Descpription: Project Map is used to store the projects configs in Salesforce Backend

*/

// TODO: create new class for Project initizialization

public without sharing class ProjectMap {
 
        public static Map<string, Project > Projects {
          get {
            if (Projects == null) {

              // CTA - add propulsion 
              Project ctaProject = New Project();
              CreateObjectData ctaPropulsion = New CreateObjectData();
              ctaPropulsion.Name = 'Propulsion';
              ctaPropulsion.APIname = 'Propulsion_Part__c';
              ctaPropulsion.PartNameList = new List<String> {
                  'PWR CBL KIT 1 AND 3.5MM CBL,MALE','PWR CBL KIT 2 AND 3.5MM CBL,MALE',
                  'PWR CBL KIT 1 AND 5MM CBL,MALE', 'PWR CBL KIT 2 AND 5MM CBL,MALE',
                  'TRACTION MOTOR 1 1TB1708-0GA02', 'TRACTION MOTOR 2 1TB1708-0GA02', 'TRACTION MOTOR 3 1TB1708-0GA02', 'TRACTION MOTOR 4 1TB1708-0GA02',
                  'MOUNTING SET 1, MOTOR CTA S7000', 'MOUNTING SET 2, MOTOR CTA S7000', 'MOUNTING SET 3, MOTOR CTA S7000', 'MOUNTING SET 4, MOTOR CTA S7000',
                  'MOUNTING SET 1, SERVICE KIT CPC', 'MOUNTING SET 2, SERVICE KIT CPC', 'MOUNTING SET 3, SERVICE KIT CPC', 'MOUNTING SET 4, SERVICE KIT CPC',
                  'BRAKE RESISTOR 147206 (right side)', 'BRAKE RESISTOR 147207 (left side)',
                  'KNIFE SWITCH IES CTA 7000 1POL','HIGH SPEED CIRCUIT BREAKER, CT',
                  '1 - TRACTION GEAR GETR ASEF 288- ', '2 - TRACTION GEAR GETR ASEF 288- ', '3 - TRACTION GEAR GETR ASEF 288- ', '4 - TRACTION GEAR GETR ASEF 288- ',
                  'TRACTION INVERTER METRO',
                  'Knife Switch Connector Kit', 
                  'Friction Brake Monitoring Device'};
      
              ctaPropulsion.PartSupplierList = new List<String> {
                      'Siemens RS TD', 'Siemens RS TD',
                      'Siemens RS TD', 'Siemens RS TD',
                      'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD',
                      'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD',
                      'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD',
                    'GINO', 'GINO',
                    'MERSEN',
                    'Secheron',
                    'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD',
                    'Siemens RS TD',
                    'MERSEN',
                    'Lütze Transportation GmbH'
                    };
             ctaPropulsion.PartMaterialNumberList = new List<String> {
              'RS:A8573600', 'RS:A8573600',
              'RS:A8781600', 'RS:A8781600',
              'RS:A8598600', 'RS:A8598600', 'RS:A8598600', 'RS:A8598600',
              'RS:A8781800', 'RS:A8781800', 'RS:A8781800', 'RS:A8781800',
              'RS:A8781900', 'RS:A8781900', 'RS:A8781900', 'RS:A8781900',
              'RS:A9105600', 'RS:A9105700',
              'RS:A9105800',
              'RS:A8643300',
              'RS:A8598700', 'RS:A8598700', 'RS:A8598700', 'RS:A8598700',
              'RS:A8573200',
              'RS:A9266001',
              'RS:A9266101'};
      
              ctaPropulsion.PartSupplierPartNumberList = new List<String> {
                  'A5E41880695', 'A5E41880695',
                  'A5E41880710', 'A5E41880710',
                  'A5E39302319', 'A5E39302319', 'A5E39302319', 'A5E39302319',
                  'A5E40671393', 'A5E40671393', 'A5E40671393', 'A5E40671393',
                  'A5E39684855', 'A5E39684855', 'A5E39684855', 'A5E39684855',
                '6GN1-B01162', '6GN1-B01170',
                'X1065932A',
                'UR1041TDS2M2SQF1EDN1',
                'A5E40669580', 'A5E40669580', 'A5E40669580', 'A5E40669580',
                'A5E39217738',
                '1064219',
                '810021-FBM-0021'
                };
           

              ctaProject.ComponentList = new Set<CreateObjectData>{};
              ctaProject.ComponentList.add(ctaPropulsion);
              

                // Trucks

              CreateObjectData ctaTruck = New CreateObjectData();
              ctaTruck.Name = 'Truck';
              ctaTruck.APIname = 'Truck_Part__c';
              ctaTruck.PartNameList = new List<String> {
                    'Kingpin sleeve'};
        
              ctaTruck.PartSupplierList = new List<String> {
                        'MMI SONORA'
                      };
              ctaTruck.PartMaterialNumberList = new List<String> {
                'A2V00002737579'};
        
              ctaTruck.PartSupplierPartNumberList = new List<String> {
                    'XXXXXX'
              };
            
              ctaProject.ComponentList.add(ctaTruck);
              // System.debug(ctaProject.ComponentList[0]);
              // System.debug(ctaProject.ComponentList[1]);
        

              // OCSC - add propulsion 

              Project ocscProject = New Project();
              CreateObjectData ocscPropulsion = New CreateObjectData();
              ocscPropulsion.Name = 'Propulsion';
              ocscPropulsion.APIname = 'Propulsion_Part__c';
              ocscPropulsion.PartNameList = new List<String> {
                  'PWR CBL KIT 1 AND 3.5MM CBL,MALE','PWR CBL KIT 2 AND 3.5MM CBL,MALE',
                  'PWR CBL KIT 1 AND 5MM CBL,MALE', 'PWR CBL KIT 2 AND 5MM CBL,MALE',
                  'TRACTION MOTOR 1 1TB1708-0GA02', 'TRACTION MOTOR 2 1TB1708-0GA02', 'TRACTION MOTOR 3 1TB1708-0GA02', 'TRACTION MOTOR 4 1TB1708-0GA02',
                  'MOUNTING SET 1, MOTOR CTA S7000', 'MOUNTING SET 2, MOTOR CTA S7000', 'MOUNTING SET 3, MOTOR CTA S7000', 'MOUNTING SET 4, MOTOR CTA S7000',
                  'MOUNTING SET 1, SERVICE KIT CPC', 'MOUNTING SET 2, SERVICE KIT CPC', 'MOUNTING SET 3, SERVICE KIT CPC', 'MOUNTING SET 4, SERVICE KIT CPC',
                  'BRAKE RESISTOR 147206 (right side)', 'BRAKE RESISTOR 147207 (left side)',
                  'KNIFE SWITCH IES CTA 7000 1POL','HIGH SPEED CIRCUIT BREAKER, CT',
                  '1 - TRACTION GEAR GETR ASEF 288- ', '2 - TRACTION GEAR GETR ASEF 288- ', '3 - TRACTION GEAR GETR ASEF 288- ', '4 - TRACTION GEAR GETR ASEF 288- ',
                  'TRACTION INVERTER METRO',
                  'Knife Switch Connector Kit', 
                  'Friction Brake Monitoring Device'};
      
              ocscPropulsion.PartSupplierList = new List<String> {
                      'Siemens RS TD', 'Siemens RS TD',
                      'Siemens RS TD', 'Siemens RS TD',
                      'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD',
                      'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD',
                      'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD',
                    'GINO', 'GINO',
                    'MERSEN',
                    'Secheron',
                    'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD', 'Siemens RS TD',
                    'Siemens RS TD',
                    'MERSEN',
                    'Lütze Transportation GmbH'
                    };
              ocscPropulsion.PartMaterialNumberList = new List<String> {
              'RS:A8573600', 'RS:A8573600',
              'RS:A8781600', 'RS:A8781600',
              'RS:A8598600', 'RS:A8598600', 'RS:A8598600', 'RS:A8598600',
              'RS:A8781800', 'RS:A8781800', 'RS:A8781800', 'RS:A8781800',
              'RS:A8781900', 'RS:A8781900', 'RS:A8781900', 'RS:A8781900',
              'RS:A9105600', 'RS:A9105700',
              'RS:A9105800',
              'RS:A8643300',
              'RS:A8598700', 'RS:A8598700', 'RS:A8598700', 'RS:A8598700',
              'RS:A8573200',
              'RS:A9266001',
              'RS:A9266101'};
      
              ocscPropulsion.PartSupplierPartNumberList = new List<String> {
                  'A5E41880695', 'A5E41880695',
                  'A5E41880710', 'A5E41880710',
                  'A5E39302319', 'A5E39302319', 'A5E39302319', 'A5E39302319',
                  'A5E40671393', 'A5E40671393', 'A5E40671393', 'A5E40671393',
                  'A5E39684855', 'A5E39684855', 'A5E39684855', 'A5E39684855',
                '6GN1-B01162', '6GN1-B01170',
                'X1065932A',
                'UR1041TDS2M2SQF1EDN1',
                'A5E40669580', 'A5E40669580', 'A5E40669580', 'A5E40669580',
                'A5E39217738',
                '1064219',
                '810021-FBM-0021'
                };
           // in Apex fisrt you need to initialize List, Map, etc to be able to add items
              ocscProject.ComponentList = new Set<CreateObjectData>{};
              ocscProject.ComponentList.add(ctaPropulsion);


              Projects = new Map<string, Project>{
               'CTA-CRRC' => ctaProject,
               'OCSC' => ocscProject
              };
                }
        
                return  Projects;
              }
            
        set;}


}
