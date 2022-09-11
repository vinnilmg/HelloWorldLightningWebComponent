global class WarehouseCalloutServiceMock implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest req) {
        System.assertEquals('https://th-superbadge-apex.herokuapp.com/equipment', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());

        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody('[{"_id":"55d66226726b611100aaf741","replacement":false,"quantity":5,"name":"Generator 1000 kW","maintenanceperiod":365,"lifespan":120,"cost":5000,"sku":"100003"},{"_id":"55d66226726b611100aaf742","replacement":true,"quantity":183,"name":"Cooling Fan","maintenanceperiod":0,"lifespan":0,"cost":300,"sku":"100004"}]');
        return res;
    }
}
