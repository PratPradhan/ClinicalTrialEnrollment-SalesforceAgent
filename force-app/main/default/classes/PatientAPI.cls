@RestResource(urlMapping='/patients')
global with sharing class PatientAPI {
    @HttpGet
    global static List<Patient__c> getPatients(){
        return [SELECT id, Name, Condition__c FROM Patient__c LIMIT 10];
    }
}