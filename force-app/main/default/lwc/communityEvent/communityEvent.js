import { LightningElement } from 'lwc';
import Id from '@salesforce/user/Id';
export default class CommunityEvent extends LightningElement {
    connectedCallback() {
        console.log('CommunityEvent connectedCallback');
        console.log('current user logged in id',Id);
        const selectedEvent =new CustomEvent('Current_User_Id', {
            detail: {
                id: Id
            },
            bubbles: true,
            composed: true
        });
        window.dispatchEvent(selectedEvent);
    }
}