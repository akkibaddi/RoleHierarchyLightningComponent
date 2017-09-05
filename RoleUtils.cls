public with sharing class RoleUtils {

 

  public static Set<ID> getImmediateSubRoleIds(Set<ID> roleIds) {

    Set<ID> currentRoleIds = new Set<ID>();
    Set<Id> ImmediateRoleIds=new set<ID>();
    // get all of the roles underneath the passed roles
    for(UserRole userRole :[select Id from UserRole where ParentRoleId 
      IN :roleIds AND ParentRoleID != null])
    	ImmediateRoleIds.add(userRole.Id);
      
     
    return ImmediateRoleIds;

	}
}