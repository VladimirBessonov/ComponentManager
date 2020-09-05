/******************************************************************************
* Author: Vladimir Bessonov
* Date: Aug 30, 2020
* Descpription: Implementation class for ICreateObjectForProject to creating Object. - 1 case for Factory

*/

public without sharing class CreatePropulsionSetForProject implements ICreateObjectForProject{


    public string createObject(String ProjectName, String ObjectName, ID ObjectID, CreateObjectData ObjData) {

                    // //System.debug('Part List' + PartList);
                    // Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectName);
                    // String listType = 'List<' + targetType + '>';
                    // List<SObject> PartList = (List<SObject>)Type.forName(listType).newInstance();

                
                    List<Propulsion_Part__c> PartList = New List<Propulsion_Part__c>();
                    List<String> PartNames = ObjData.PartNameList;
                    List<String> PartMaterialNumber = ObjData.PartMaterialNumberList;
                    List<String> PartSupplierPartNumber = ObjData.PartSupplierPartNumberList;
                    List<String> PartSupplier = ObjData.PartSupplierList;
              
                     for(Integer i=0; i< PartNames.size();i++){
                      Propulsion_Part__c part = new Propulsion_Part__c(Propulsion__c=ObjectID, Name = PartNames[i], 
                        Material_Number__c = PartMaterialNumber[i],
                        Supplier_Part_Number__c = PartSupplierPartNumber[i], 
                        Supplier__c = PartSupplier[i]);
                      
                      PartList.add(part);
                      }  
                      Database.SaveResult[] srList = Database.insert(PartList, true);
              
                     for(Database.SaveResult sr : srList) {
                       if (sr.isSuccess()) {
                         System.debug('Successfully added parts to prop set: ' + ObjectID);
                       } else {
                         for(Database.Error objErr : sr.getErrors()) {
                           System.debug('Error ocurred: ');
                           System.debug(objErr.getStatusCode() + ' : ' + objErr.getMessage());
                            System.debug('Prop part affected' + ':'+ objErr.getFields());
                         }
                       }
                     }
          

        return ObjectID;
       
    }


    public string createObjectRequest(String ProjectName, String ObjectName, ID ObjectID, CreateObjectData ObjData) {
        string errors= Validation.validateObjectCreateRequest(ObjData);
        if(string.isNotBlank(errors))
        {
            throw new BaseException(errors); 
        }
        return createObject(ProjectName, ObjectName, ObjectID, ObjData);   
      }

}

