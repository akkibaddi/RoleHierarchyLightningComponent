global with sharing class DFSUtils implements kkltng.HierarchyComponentInterface{
     global integer uniqValue=0;
	 global kkltng.HierarchyComponentController.hierarchyData getFullHierarchyData(String inData){
	 	 // get requested user's role
        Id roleId = [select UserRoleId,UserRole.Name from User where  UserRole.Name= :inData].UserRoleId;

	 	kkltng.HierarchyComponentController.hierarchyData hdAll = new kkltng.HierarchyComponentController.hierarchyData();
	 	List<kkltng.HierarchyComponentController.node> nodes    = new List<kkltng.HierarchyComponentController.node>();
	 	DFS(roleId,nodes, -1);
         hdAll.nodes=nodes;

	 	return hdAll;

	 }

	  global kkltng.HierarchyComponentController.hierarchyData getHierarchyDataOnDemand(String inData,kkltng.HierarchyComponentController.node rootNode){
        return null;
    }

    global  void DFS(Id roleId, List<kkltng.HierarchyComponentController.node> nodes,integer parentid){
    	uniqValue++;
    	 UserRole currentRoleName            =new UserRole();
                currentRoleName                           =[Select id, Name 
                                                  from UserRole 
                                                  where id=:roleId limit 1];
       integer currentParentID=uniqValue;
    	kkltng.HierarchyComponentController.node node = new kkltng.HierarchyComponentController.node();
            node.id                                       = String.valueOf(uniqValue);
            node.parentid                                 = string.valueOf(parentid);
            if(parentid==-1){
            	node.parentid=null;
            }
            node.text                                   = 'Node: ' + currentRoleName.Name ;
            node.description                            = 'Node Name: ' + currentRoleName.Name;
            node.type                                   = 'text';
            node.imageURL                               = 'https://someurl here';
            kkltng.HierarchyComponentController.evt evt = new kkltng.HierarchyComponentController.evt();
            node.rootNodeClick                          = null;
            node.leftIconClick                          = null;
            node.rightIconClick                         = null;
            node.data                                   = null;
            nodes.add(node);

    	
    	set<Id> SubRoleIdsSet=RoleUtils.getImmediateSubRoleIds(new Set<ID>{roleId});
    	list<Id> SubRoleIdsList=new list<Id>(SubRoleIdsSet);


    	for(integer i=0;i<SubRoleIdsList.size();i++){
    		DFS(SubRoleIdsList[i], nodes, currentParentID);

    	}

            


    }


    }