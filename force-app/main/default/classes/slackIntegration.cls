public with sharing class slackIntegration {

    private static final string SLACK_WEBHOOK_URL ='https://hooks.slack.com/services/??????????????';

    @future(callout=true)
    public static void sendMessageToSlack(string message){
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SLACK_WEBHOOK_URL);
        request.setMethod('POST');
        request.setHeader('Content-Type','application/json;charset=UTF-8');

        //prepare message paysload
        Map<string, Object> payload =new Map<string, Object>();
        payload.put('text', message);

        //serializer payload and send
        String jsonPayload = JSON.serialize(payload);
        request.setBody(jsonPayload);

        Http http =new Http();
        HttpResponse response = http.send(request);

        //log response if error
        if(response.getStatusCode() != 200){
            System.debug('Error sending response to slack '+ response.getBody());

        }   else{
            System.debug('Slack Message sent: '+ message);
        } 
    }
}