@isTest
public class RoleUtilsTest {
    @testSetup static void prepareData(){
        UserRole MainUser = new UserRole(DeveloperName = 'CEO1', Name = 'My Role');
        insert MainUser;
        UserRole SubUser = new UserRole(DeveloperName = 'CFO1', Name = 'My Role', ParentRoleId=MainUser.Id);
        insert SubUser;
         User u1			= new User(
         ProfileId 			= [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
         LastName 			= 'last1',
         Email 				= 'puser1000@amamama.com',
         Username 			= 'puser1000@amamama.com' + System.currentTimeMillis(),
         CompanyName 		= 'TEST1',
         Title 				= 'title1',
         Alias 				= 'alias1',
         TimeZoneSidKey 	= 'America/Los_Angeles',
         EmailEncodingKey 	= 'UTF-8',
         LanguageLocaleKey 	= 'en_US',
         LocaleSidKey 		= 'en_US',
         UserRoleId 		= MainUser.Id
);
        insert u1;
         User u2			= new User(
         ProfileId 			= [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
         LastName 			= 'last2',
         Email 				= 'puser2000@amamama.com',
         Username 			= 'puser2000@amamama.com' + System.currentTimeMillis(),
         CompanyName 		= 'TEST2',
         Title 				= 'title2',
         Alias 				= 'alias2',
         TimeZoneSidKey 	= 'America/Los_Angeles',
         EmailEncodingKey 	= 'UTF-8',
         LanguageLocaleKey 	= 'en_US',
         LocaleSidKey 		= 'en_US',
         UserRoleId 		= MainUser.Id
);
        insert u2;
        
        
    }
    
    @isTest
    public static void RoleUtils(){
        id roleId=[select UserRoleId from user where name='last1' limit 1].UserRoleId;
        set<id> roleIds=new Set<ID>{roleId};
        set<id> Immroles=RoleUtils.getImmediateSubRoleIds(roleIds);
        System.assertEquals(Immroles.size(), 1);
        
        
    }
    

}