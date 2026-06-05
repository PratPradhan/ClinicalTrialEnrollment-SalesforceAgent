public with sharing class contactCtrl {
    public contactCtrl() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [
            SELECT
                Id,
                Name,
                Title,
                Department,
                Email,
                Phone,
                Account.Name
            FROM Contact
            WHERE IsDeleted = false
            ORDER BY Name ASC
            LIMIT 200
        ];
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> searchContact(string searchTerm){
        if(string.isBlank(searchTerm)){
            return getContacts();
        }
        String query= '*'+ string.escapeSingleQuotes(searchTerm) +'*';
        List<List<sObject>> results = [FIND :query IN ALL FIELDS  
                                    RETURNING Contact(Id, Name,Title,Department,Email,Phone,Account.Name
                                    ORDER BY Name ASC LIMIT 200)
                                    ];
                                    return (List<contact>) results[0];
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsByDept(String dept) {
        if (String.isBlank(dept) || dept == 'All') {
            return getContacts();
        }

        return [
            SELECT Id, Name, Title, Department, Email, Phone
            FROM  Contact
            WHERE Department = :dept
              AND IsDeleted  = false
            ORDER BY Name ASC
            LIMIT  200
        ];
    }
}