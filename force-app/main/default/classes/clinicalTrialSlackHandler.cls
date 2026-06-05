public without sharing class clinicalTrialSlackHandler {

    public class Input{

        @InvocableVariable(required=true)
        public Id patientId;

        @InvocableVariable(required=true)
        public string message;
    }

    public class Output{
        @InvocableVariable(required=true)
        public string summaryMessage;
    }
    @InvocableMethod(label='Send Slack message to Clinical Trial')
    public static List<Output> sendSlackMessage(List<Input> input){
        List<Output> results =new List<Output>();

        string slackMessage = Input[0].message + ' for patient ' + input[0].patientId + '*';
        SlackIntegration.sendMessageToSlack(slackMessage);
        Output o =new Output();
        o.summaryMessage = 'Salck message sent to Clinical Trial Successfully';
        results.add(o);
        return results;

    }

}