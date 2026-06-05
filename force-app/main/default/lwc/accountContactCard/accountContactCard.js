import { LightningElement, api, wire } from "lwc";
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';
import NAME_F      from '@salesforce/schema/Contact.Name';
import FIRST_F     from '@salesforce/schema/Contact.FirstName';
import LAST_F      from '@salesforce/schema/Contact.LastName';
import EMAIL_F     from '@salesforce/schema/Contact.Email';
import PHONE_F     from '@salesforce/schema/Contact.Phone';
import TITLE_F     from '@salesforce/schema/Contact.Title';
import DEPT_F      from '@salesforce/schema/Contact.Department';
import ACCT_NAME_F from '@salesforce/schema/Contact.Account.Name';
// ↑ dot notation traverses the lookup — returns parent Account's Name

const FIELDS = [NAME_F, FIRST_F, LAST_F, EMAIL_F, PHONE_F, TITLE_F, DEPT_F, ACCT_NAME_F];

export default class ContactCard extends NavigationMixin(LightningElement) {

    // ── Public props ────────────────────i──────────────────────
    @api recordId;              // auto-set by a record page
    @api cardTitle = 'Contact'; // parent can override


    @wire(getRecord, {recordId: '$recordId', fields : FIELDS})
    contact;

    get name()        { return getFieldValue(this.contact?.data, NAME_F); }
    get firstName()   { return getFieldValue(this.contact?.data, FIRST_F); }
    get lastName()    { return getFieldValue(this.contact?.data, LAST_F); }
    get email()       { return getFieldValue(this.contact?.data, EMAIL_F); }
    get phone()       { return getFieldValue(this.contact?.data, PHONE_F); }
    get title()       { return getFieldValue(this.contact?.data, TITLE_F); }
    get department()  { return getFieldValue(this.contact?.data, DEPT_F); }
    get accountName() { return getFieldValue(this.contact?.data, ACCT_NAME_F); }

    get initials(){
        const f =this.firstName?.[0] ?? '';
        const l = this.lastName?.[0] ?? '';
        return (f+l).toUpperCase();
    }

    get displayName(){
        if(!this.lastName) return this.name;
        return `${this.lastName}, ${this.firstName}`;
    }

    get subtitle() {
        // merge title + dept + account, skip nulls
        return [this.title, this.department, this.accountName]
            .filter(Boolean)
            .join(' · ') || 'No title';
    }

    get isLoading() {
        return  (!this.contact.data && !this.contact.error);
        
    }
    get hasError(){
        return !!this.contact?.error;
    
    }
    get hasData() {
        return !!this.contact?.data;
    }

    get errorMessage() {
        return this.contact?.error?.body?.message ?? 'Unknown error';
    }

    // ── Navigation ────────────────────────────────────────────
    navigateToRecord() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: { recordId: this.recordId, actionName: 'view' }
        });
    }

}