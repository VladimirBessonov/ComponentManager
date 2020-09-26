/******************************************************************************
* Author: Vladimir Bessonov
* Date: Aug 30, 2020
* Descpription: Implementation class for ICreateObjectForProject to creating Object. - 2 case for Factory

*/

public without sharing class CreateTruckSetForProject implements ICreateObjectForProject{


    public string createObject(String ProjectName, String ObjectName, ID ObjectID, CreateObjectData ObjData) {
                    List<Truck_Part__c> PartList = New List<Truck_Part__c>();
                    List<String> PartNames = ObjData.PartNameList;
                    List<String> PartMaterialNumber = ObjData.PartMaterialNumberList;
                    List<String> PartSupplierPartNumber = ObjData.PartSupplierPartNumberList;
                    List<String> PartSupplier = ObjData.PartSupplierList;
              
                     for(Integer i=0; i< PartNames.size();i++){
                        Truck_Part__c part = new Truck_Part__c(Truck__c=ObjectID, Name = PartNames[i], 
                        Material_Number__c = PartMaterialNumber[i],
                        Supplier_Part_Number__c = PartSupplierPartNumber[i], 
                        Supplier__c = PartSupplier[i]);
                      // insert part;
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

        // add checks and throw exception 
        // add factory class and simplify CreateObjectForProject - separate create Prop, creat Truck, ext
        
    }


    public string createObjectRequest(String ProjectName, String ObjectName, ID ObjectID, CreateObjectData ObjData) {
        //string errors=validateObjectCreateRequest(ObjData);
        string errors= Validation.validateObjectCreateRequest(ObjData);
        if(string.isNotBlank(errors))
        {
            throw new BaseException(errors); 
        }
        return createObject(ProjectName, ObjectName, ObjectID, ObjData);   
    }

}

