# RoleHierarchyLightningComponent

This Component is used to display Role Hoerarchy in Lightning Experience with easy to navigate, search hierarchy based on the <a href="https://appexchange.salesforce.com/listingDetail?listingId=a0N30000000q7G6EAI">App exchange Lightning Component</a> 

Steps to Install

1) Get the app listed above from app exchange

2) Deploy the following Components 

  <b>Apex Classes:</b><br/>
  DFSUtils<br/>
  RoleUtils<br/>
  RoleUtilsTest<br/>


  <b>Lightning Components:</b><br/>
  RoleHierarchy<br/>

  <b>StandALoneApps:</b><br/>
  RoleHierarchyApp<br/>

  <b>LightningPages:</b><br/>
  RoleHierarchy<br/>


3) Activate the Page for required app/profiles you wish.

4) As this managed package depends on the apexinput attribute, we need to input this attribute in RoleHierarchy Component.
for example we can input apexInput="CEO" in RoleHierarchy Component from developer console.

