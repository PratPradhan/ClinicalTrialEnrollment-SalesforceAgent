import { LightningElement, api } from 'lwc';
import {showToastEvent} from 'lightning/platformShowToastEvent';




export default class ContactRecordViewForm extends LightningElement {

    @api recordId;
    @api cardTitle = 'Contact';

    handleSuccess(event){
        this.dispatchEvent(new showToastEvent({
            title: 'Saved',
            message: 'Contact Updated Successfully',
            variant: 'success'
        }));

    }
    handleError(event){
        this.dispatchEvent(new showToastEvent({
            title: 'Error',
            message: event.detail.message,
            variant: 'error'
        }));
    }
}