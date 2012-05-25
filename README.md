
THIS README IS FOR THE MASTER BRANCH OF API DOCUMENTATION AND REFLECTS THE WORK CURRENTLY EXISTING ON THE MASTER BRANCH.

SUMMARY
-------
Api Documentation is a complete open source solution built with Ruby on Rails. It was originally developed by RAILSFACTORY and is now maintained by a dedicated RailsFactory team.

Api Documentation actually consists of information about the api's and procedure's to call and use it.


Installation Steps:
-------------------
 step 1:

    Clone the Git repo

    git clone git@github.com:railsfactory/api_documentation_cms.git

 step 2:

    cd api_documentation_cms

 step 3:

    bundle install

 step 4:

    rake db:create

 step 5:

    rake db:migrate

 step 6:

    rake db:seed

 step 7:

    rails server

Http Basic Authentication:
-------------------------
    Username : apidoc
    Password : apidoc

Default Admin Credentials:
-------------------------
    Email    : admin@apidoc.com
    password : apidoc

How to use the document:
-----------------------
    1. User can create new api lists, and create api methods for the specific api list.

       1.1. Login as an admin user by clicking the link "Settings".
       1.2. A link to create new api list appears.
       1.3. On creating a new api list new api methods can be added to the list.

    2. To edit the existing api methods
       2.1. Click the link "Method" available in the Top Right corner of the screen.
       2.2  A Screen with list of Api Methods will be displayed, with option to Edit / Destroy.

    3. To view the Existing Api methods, click link "Api Methods". Api Methods will be displayed in the left side, and on clicking the particular method,the information about the method will be displayed in the right side of the page. 

    4. The API's created can be testedby providing the access token & request url (site url) in the settings page.  And click the edit button the API information page.

    
