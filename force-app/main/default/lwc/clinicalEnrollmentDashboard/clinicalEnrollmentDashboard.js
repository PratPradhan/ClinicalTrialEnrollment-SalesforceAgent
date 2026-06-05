import { LightningElement, wire } from 'lwc';
import getEnrollmentSummary from '@salesforce/apex/ClinicalTrialEnrollmentController.getEnrollmentSummary';
import getEnrollmentServices from '@salesforce/apex/ClinicalTrialEnrollmentController.getEnrollmentServices';

export default class ClinicalEnrollmentDashboard extends LightningElement {
    summary;
    services = [];
    error;

    @wire(getEnrollmentSummary)
    wiredSummary({ data, error }) {
        if (data) {
            this.summary = {
                ...data,
                enrollmentPercent: this.calcPercent(data.totalEnrolled, data.enrollmentTarget),
                enrollmentPercentLabel: `${this.calcPercent(data.totalEnrolled, data.enrollmentTarget)}%`
            };
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.summary = undefined;
        }
    }

    @wire(getEnrollmentServices)
    wiredServices({ data, error }) {
        if (data) {
            this.services = data.map((service, index) => ({
                ...service,
                key: `service-${index}`,
                statusClass: this.statusBadgeClass(service.status)
            }));
        } else if (error && !this.error) {
            this.error = error;
        }
    }

    get hasSummary() {
        return Boolean(this.summary);
    }

    get hasServices() {
        return this.services.length > 0;
    }

    get isLoading() {
        return !this.summary && !this.error;
    }

    get studyStatusClass() {
        const status = this.summary?.studyStatus?.toLowerCase() || '';
        if (status === 'recruiting') {
            return 'status-badge status-recruiting';
        }
        if (status === 'closed') {
            return 'status-badge status-closed';
        }
        return 'status-badge status-default';
    }

    get progressStyle() {
        const percent = this.summary?.enrollmentPercent ?? 0;
        return `width: ${percent}%`;
    }

    calcPercent(enrolled, target) {
        if (!target) {
            return 0;
        }
        return Math.min(100, Math.round((enrolled / target) * 100));
    }

    statusBadgeClass(status) {
        const normalized = (status || '').toLowerCase();
        if (normalized === 'active') {
            return 'service-status service-active';
        }
        return 'service-status service-default';
    }
}