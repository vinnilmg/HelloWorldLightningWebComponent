@isTest
global class ParkServiceMock implements WebServiceMock {
  global void doInvoke(
    Object stub, Object request, Map<String, Object> response, String endpoint, String soapAction, String requestName,
    String responseNS, String responseName, String responseType) {

      ParkService.byCountryResponse responseMock = new ParkService.byCountryResponse();
      String[] listPark = new List<String>();
      listPark.add('TESTE1');
      listPark.add('TESTE2');

      responseMock.return_x = listPark;
      response.put('response_x', responseMock);
  }
}