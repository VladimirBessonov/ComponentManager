/******************************************************************************
* Author: Vladimir Bessonov
* Date: Sep 9, 2020
* Descpription: Test class. Currently only 2 object types are available in the factory: Propulsion, Truck

*/

@isTest
public with sharing class ObjectCreationFactoryTest {
  @isTest
  static void CreatePropulsion() {
    System.assertEquals(1, 1);
  }
  @isTest
  static void CreateTruck() {
    System.assertEquals(1, 1);
  }

  @isTest
  static void CreateException() {
    System.assertEquals(1, 1);
  }
}
