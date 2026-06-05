import { LightningElement, api } from 'lwc';

import getImageInfo from '@salesforce/apex/googleAPIController.getImageInfo';

export default class CloudVisionComponent extends LightningElement {
    @api recordId;
    data = [];

    handleClick(){
        getImageInfo({recordId: this.recordId})
            .then((response) => {
                this.data = response;
                console.log(recordId+ '----'+ response);
            })
            .catch((error) => {
                console.log(error);
            });

        }
    }