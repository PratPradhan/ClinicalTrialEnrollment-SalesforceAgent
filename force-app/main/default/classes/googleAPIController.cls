public with sharing class googleAPIController {
    public googleAPIController() {

    }

    @AuraEnabled(cacheable =false)
    public static List<imageAnnotationInfo> getImageInfo(Id recordId){
        //preparing requestBody
        jsonRequestParser requestParser = new jsonRequestParser();
        requests requestItem = new requests();
        features feat = new features();
        feat.type ='LABEL_DETECTION';
        feat.maxResults = '5';

        requestItem.features = new List<features>{feat};
        //image 
        image img = new image();
        img.content = base64ImageProc(recordId);
        requestItem.image = img;

        requestParser.requests = new List<requests>{requestItem};
        string reqBody = JSON.serialize(requestParser);
        //String reqBody ='{   "requests": [     {       "features": [         {           "maxResults": 5,           "type": "LABEL_DETECTION"         }       ],       "image": {         "source": {           "imageUri": "gs://cloud-samples-data/vision/label/setagaya.jpeg"         }       }     }   ] }';
        //String reqBody ='{   "requests": [     {       "features": [         {           "maxResults": 5,           "type": "LABEL_DETECTION"         }       ],       "image": {         "source": {           "imageUri": "https://www.sozocardiology.com/wp-content/uploads/2021/05/right_heart_study_01-768x432.jpg"         }       }     }   ] } ';
        Http http =new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setEndpoint('https://vision.googleapis.com/v1/images:annotate?key=AIzaSyDigWm_rK4025fWp_6EN4lUbiE_wmLhu9A');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(reqBody);
        HttpResponse res = http.send(req);

        if(res.getStatusCode() == 200){
            
            JsonParser jsonInfo =(JsonParser) JSON.deserialize(res.getBody(), JsonParser.class);
            list<responses> responses = jsonInfo.responses;
            list<labelAnnotations> annotations = responses[0].labelAnnotations;

            List<imageAnnotationInfo> imageInfoList = new List<imageAnnotationInfo>();
            List<Image_Result__c> imageResultList =new List<Image_Result__c>();

            for(labelAnnotations annotationElement : annotations){
                //Decimal score = annotationElement.score;
                //String description = annotationElement.description;
                imageAnnotationInfo imageInfo = new imageAnnotationInfo();
                imageInfo.description =annotationElement.description;
                imageInfo.score=annotationElement.score;
                imageInfoList.add(imageInfo);
                Image_Result__c imageResult = new Image_Result__c();
                imageResult.Account__c = recordId;
                imageResult.Image_Description__c = annotationElement.description;
                imageResult.Image_Score__c =annotationElement.score;
                imageResultList.add(imageResult);

            }
            if(imageResultList.size()>0){
                insert imageResultList;
            }
            /*
            res.getBody();


            Map<String, Object> responseMap = (Map<String,Object>)JSON.deserializeUntyped(
                res.getBody());
            List<Object> responseList = (List<Object>)responseMap.get('responses');

            Map<String, Object> firstResponseMap = (Map<String, Object>)responseList[0];

            List<Object> responseAnnotation = (List<Object>)firstResponseMap.get('labelAnnotations');

            

            for(Object annotation: responseAnnotation){
                Map<String, Object> annotationMap = (Map<String, Object>)annotation;
                String description = (String) annotationMap.get('description');
                Decimal score = (Decimal) annotationMap.get('score');

                imageAnnotationInfo imageInfo = new imageAnnotationInfo();
                imageInfo.description =description;
                imageInfo.score=score;
                imageInfoList.add(imageInfo);

            }
            System.debug('imageInfoList***' +imageInfoList);
            */
            return imageInfoList;

        }else{
            return null;
        }
    }

public class imageAnnotationInfo{
    @AuraEnabled
    public String description;
    @AuraEnabled
    public Decimal score;
}

// Response class
public class JsonParser{
    public list<responses> responses{get;set;}
}
public class responses{
    public list<labelAnnotations> labelAnnotations{get;set;}
}
public class labelAnnotations{
    public Decimal topicality{get;set;}
    public Decimal score{get;set;}
    public String description{get;set;}
    public String mid{get;set;}
}

//Request Class
public class jsonRequestParser{
    public list<requests> requests{get;set;}
}
public class requests{
    public list<features> features{get;set;}
    public image image{get;set;}
}
public class image{
    public String content{get;set;}
}
public class features{
    public String type{get;set;}
    public String maxResults{get;set;}
}

//contentDocument child of account record
public static string base64ImageProc(Id accountId){
    ContentDocumentLink cdl = [
    SELECT ContentDocumentId
    FROM ContentDocumentLink
    WHERE LinkedEntityId = :accountId
    LIMIT 1
];

ContentVersion cv = [
    SELECT VersionData
    FROM ContentVersion
    WHERE ContentDocumentId = :cdl.ContentDocumentId
    ORDER BY VersionNumber DESC
    LIMIT 1
];

String base64Image = EncodingUtil.base64Encode(cv.VersionData);
return base64Image;

}

}