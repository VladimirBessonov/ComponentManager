/******************************************************************************
* Author: Vladimir Bessonov
* Date: Aug 30, 2020
* Descpription: Interface to implenent for Factory Pattern.

*/

public interface ICreateObjectForProject {
    // return general object

   String createObjectRequest(String ProjectName, String ObjectName, ID ObjectID, CreateObjectData ObjData);

}
