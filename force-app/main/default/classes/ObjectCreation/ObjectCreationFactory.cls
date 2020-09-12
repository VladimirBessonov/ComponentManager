/******************************************************************************
* Author: Vladimir Bessonov
* Date: Sep 9, 2020
* Descpription: Class is used for different object type and record creation. 
Based on ObjectNameType different class is returned for object creation

*/

public class ObjectCreationFactory {
  public ICreateObjectForProject getObjectRequest(
    string ProjectName,
    string ObjectNameType,
    ID Compid,
    CreateObjectData component
  ) {
    ICreateObjectForProject requestObject;
    System.debug(
      'ObjectNameType not empty' + string.isNotBlank(ObjectNameType)
    );
    if (string.isNotBlank(ObjectNameType)) {
      System.debug('ObjectNameType' + ObjectNameType);
      switch on ObjectNameType {
        when 'Propulsion' {
          System.debug('CreateProplsionSetForProject:');
          requestObject = new CreatePropulsionSetForProject();
        }
        when 'Truck' {
          System.debug('CreateTruckSetForProject:');
          requestObject = new CreateTruckSetForProject(); // still need to implenent Truck objectcreation
        }
        when else {
          throw new BaseException('Service Type is not valid');
        }
      }
      return requestObject;
    }
    throw new BaseException('Service Type not provided');
  }
}
