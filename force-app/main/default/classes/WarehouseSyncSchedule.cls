public with sharing class WarehouseSyncSchedule implements Schedulable {
    public void execute(SchedulableContext sc) {
        System.enqueueJob(new WarehouseCalloutService());

        /*
        Schedular JOB:
        WarehouseSyncSchedule job = new WarehouseSyncSchedule();
        String sch = '0 0 1 * * ?';
        String jobID = System.schedule('WarehouseSyncScheduleJob', sch, job);
        */
    }
}
