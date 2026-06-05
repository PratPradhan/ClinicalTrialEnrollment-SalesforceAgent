public with sharing class ClinicalTrialEnrollmentController {

    @AuraEnabled(cacheable=true)
    public static EnrollmentSummary getEnrollmentSummary() {
        EnrollmentSummary summary = new EnrollmentSummary();
        summary.studyName = 'Medicare Advantage Clinical Outcomes Study';
        summary.studyProtocol = 'MCOS-2026-014';
        summary.studyPhase = 'Phase III';
        summary.studyStatus = 'Recruiting';
        summary.totalEnrolled = 247;
        summary.enrollmentTarget = 400;
        summary.screening = 38;
        summary.pendingConsent = 12;
        summary.completedVisits = 1842;
        summary.sitesActive = 14;
        return summary;
    }

    @AuraEnabled(cacheable=true)
    public static List<EnrollmentServiceItem> getEnrollmentServices() {
        return new List<EnrollmentServiceItem>{
            buildService(
                'Patient Screening & Eligibility',
                'Pre-screen questionnaires, inclusion/exclusion review, and medical record verification.',
                'utility:search',
                312,
                'Active'
            ),
            buildService(
                'Informed Consent',
                'eConsent workflows, witness documentation, and re-consent for protocol amendments.',
                'utility:signature',
                289,
                'Active'
            ),
            buildService(
                'Randomization & Arm Assignment',
                'Stratified randomization with blinded treatment allocation per protocol.',
                'utility:sort',
                247,
                'Active'
            ),
            buildService(
                'Visit Scheduling & Coordination',
                'Baseline and follow-up visit booking, reminders, and no-show recovery.',
                'utility:event',
                1842,
                'Active'
            ),
            buildService(
                'Lab & Specimen Collection',
                'Central lab kit distribution, sample tracking, and results reconciliation.',
                'utility:product',
                1564,
                'Active'
            ),
            buildService(
                'Adverse Event Reporting',
                'SAE/AE capture, MedWatch alignment, and sponsor safety notifications.',
                'utility:warning',
                89,
                'Active'
            ),
            buildService(
                'Patient Retention & Outreach',
                'Engagement calls, transportation support, and study milestone check-ins.',
                'utility:call',
                198,
                'Active'
            ),
            buildService(
                'Regulatory & IRB Support',
                'Continuing review submissions, protocol deviation logs, and audit readiness.',
                'utility:file',
                14,
                'Active'
            )
        };
    }

    private static EnrollmentServiceItem buildService(
        String name,
        String description,
        String iconName,
        Integer patientsServed,
        String status
    ) {
        EnrollmentServiceItem item = new EnrollmentServiceItem();
        item.name = name;
        item.description = description;
        item.iconName = iconName;
        item.patientsServed = patientsServed;
        item.status = status;
        return item;
    }

    public class EnrollmentSummary {
        @AuraEnabled public String studyName;
        @AuraEnabled public String studyProtocol;
        @AuraEnabled public String studyPhase;
        @AuraEnabled public String studyStatus;
        @AuraEnabled public Integer totalEnrolled;
        @AuraEnabled public Integer enrollmentTarget;
        @AuraEnabled public Integer screening;
        @AuraEnabled public Integer pendingConsent;
        @AuraEnabled public Integer completedVisits;
        @AuraEnabled public Integer sitesActive;
    }

    public class EnrollmentServiceItem {
        @AuraEnabled public String name;
        @AuraEnabled public String description;
        @AuraEnabled public String iconName;
        @AuraEnabled public Integer patientsServed;
        @AuraEnabled public String status;
    }
}