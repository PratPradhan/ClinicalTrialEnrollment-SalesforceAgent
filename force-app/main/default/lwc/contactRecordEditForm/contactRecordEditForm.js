import { LightningElement, api } from 'lwc';
import {showToastEvent} from 'lightning/platformShowToastEvent';



export default class ContactRecordEditForm extends LightningElement {

    @api recordId;
    @api cardTitle ='Contact';

    handleSuccess(){
        this.dispatchEvent(
            new ShowToastEvent({
            title: 'Saved',
            message: 'Contact updated successful',
            variant: 'success'
        })
    );
}

    handleError(event) {
        const message =
            event.detail?.message || event.detail?.output?.errors ?.[0]?.message || 'Something went wrong.';
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message,
                    variant: 'error'
                })
            );
    }
}