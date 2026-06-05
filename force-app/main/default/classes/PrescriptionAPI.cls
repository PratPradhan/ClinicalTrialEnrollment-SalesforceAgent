@RestResource(urlMapping='/prescriptions')
global with sharing class PrescriptionAPI {
    @HttpGet
    global static List<Prescription__c> getAll() {
        return [SELECT Id, Medication__c, Dosage__c FROM Prescription__c];
    }
}