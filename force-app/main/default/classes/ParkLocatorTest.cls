@isTest
private class ParkLocatorTest {
  @isTest static void test() {
    Test.setMock(WebServiceMock.class, new ParkServiceMock());
    String pais = 'Brazil';

    String[] listParks = ParkLocator.country(pais);
    System.debug(listParks);
    System.assertEquals(listParks[0], 'TESTE1');
    System.assertEquals(listParks[1], 'TESTE2');
  }
}