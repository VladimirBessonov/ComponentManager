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

              ctaPropulsion.Name = CTAConfig.PropulisonName;
              ctaPropulsion.APIname = CTAConfig.PropulsionAPIname;

              ctaPropulsion.PartNameList = CTAConfig.PropulsionPartNameList;
              ctaPropulsion.PartSupplierList = CTAConfig.PropulsionPartSupplierList;
              ctaPropulsion.PartMaterialNumberList = CTAConfig.PropulsionPartMaterialNumberList;
              ctaPropulsion.PartSupplierPartNumberList = CTAConfig.PropulsionPartSupplierPartNumberList;
           
              ctaProject.ComponentList = new Set<CreateObjectData>{};
              ctaProject.ComponentList.add(ctaPropulsion);
              
                // CTA - add Truck

              CreateObjectData ctaTruck = New CreateObjectData();
              ctaTruck.Name = CTAConfig.TruckName;
              ctaTruck.APIname = CTAConfig.TruckAPIname;
              ctaTruck.PartNameList = CTAConfig.TruckPartNameList;
        
              ctaTruck.PartSupplierList = CTAConfig.TruckPartSupplierList;
              ctaTruck.PartMaterialNumberList = CTAConfig.TruckPartMaterialNumberList;
              ctaTruck.PartSupplierPartNumberList = CTAConfig.TruckPartSupplierPartNumberList;
            
              ctaProject.ComponentList.add(ctaTruck);

              // OCSC - add propulsion 

              Project ocscProject = New Project();
              CreateObjectData ocscPropulsion = New CreateObjectData();

              ocscPropulsion.Name = CTAConfig.PropulisonName;
              ocscPropulsion.APIname = CTAConfig.PropulsionAPIname;

              ocscPropulsion.PartNameList = CTAConfig.PropulsionPartNameList;
              ocscPropulsion.PartSupplierList = CTAConfig.PropulsionPartSupplierList;
              ocscPropulsion.PartMaterialNumberList = CTAConfig.PropulsionPartMaterialNumberList;
              ocscPropulsion.PartSupplierPartNumberList = CTAConfig.PropulsionPartSupplierPartNumberList;
           
              ocscProject.ComponentList = new Set<CreateObjectData>{};
              ocscProject.ComponentList.add(ocscPropulsion);
           // in Apex fisrt you need to initialize List, Map, etc to be able to add items

           CreateObjectData ocscTruck = New CreateObjectData();

           ocscTruck.Name = CTAConfig.TruckName;
           ocscTruck.APIname = CTAConfig.TruckAPIname;
           ocscTruck.PartNameList = CTAConfig.TruckPartNameList;
     
           ocscTruck.PartSupplierList = CTAConfig.TruckPartSupplierList;
           ocscTruck.PartMaterialNumberList = CTAConfig.TruckPartMaterialNumberList;
           ocscTruck.PartSupplierPartNumberList = CTAConfig.TruckPartSupplierPartNumberList;
         
           ocscProject.ComponentList.add(ocscTruck);

              Projects = new Map<string, Project>{
               'CTA-CRRC' => ctaProject,
               'OCSC' => ocscProject
              };
                }
                return  Projects;
              }
            
        set;}


}
