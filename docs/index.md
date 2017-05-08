# Localization in Apex and Visualforce

## Instructions

This example is meant to be done in a Developer org.

### Quickly Creating Pages
Edit your user record and set Developer Mode to checked.  
Navigate to /apex/LocalizationDemo  
Click the "Create Page LocalizationDemo" link.  
Change the first line to `<apex:page controller="LocalizationDemoController">`  
Click the Save icon.  
Click the Create Apex class 'public with sharing class LocalizationDemoController' link.  

## Example 1 : Basic Page and Controller

### Controller

Update the LocalizationDemoController class with the following code.

    public with sharing class LocalizationDemoController {
      public String name { get; set; }
      
      public LocalizationDemoController() {
        name = 'World';
      }
      
      public void submit() {
        // do some processing
      }
    }

Click the Save icon.

### Page

Update the LocalizationDemo page with the following markup.

    <apex:page controller="LocalizationDemoController" standardStylesheets="false">
      <apex:form >
        <h1>Hello, <apex:outputText value="{!name}" />!</h1><br />
        
        <apex:outputLabel for="name" value="Name" />:
        <apex:inputText id="name" value="{!name}" /><br />
        
        <apex:commandButton action="{!submit}" value="Submit" rerender="greeting" />
      </apex:form>
    </apex:page>

Click the save icon.

## Example 2 : Localization Ready Page and Controller

### Custom Labels

Enter the Setup interface

* In the Lightning Experience navigate to User Interface > Custom Labels.
* In Salesforce Classic navigate to Build > Create > Custom Labels.
* Quick Find "Custom Labels" works in either experience.

Create Custom Labels with the following values.

| Short Description | Name          | Value       |
|-------------------|---------------|-------------|
| Greeting          | Greeting      | Hello, {0}! |
| Name              | Name          | Name        |
| Submit Button     | Submit_Button | Submit      |
| Default Name      | Default_Name  | World       |
| Code Word         | Code_Word     | Astro       |
| Special Name      | Special_Name  | Ohana       |

### Controller
Update the LocalizationDemoController class with the following code.

    public with sharing class LocalizationDemoController {
      public String name { get; set; }

      public LocalizationDemoController() {
        name = System.Label.Default_Name;
      }

      public void submit() {
        if(String.isNotBlank(name) && name.equalsIgnoreCase(System.Label.Code_Word)) {
          name = System.Label.Special_Name;
        }
      }
    }

### Page

Update the LocalizationDemo page with the following markup.

    <apex:page controller="LocalizationDemoController" standardStylesheets="false">
      <apex:form >
        <h1><apex:outputText id="greeting" value="{!$Label.Greeting}">
          <apex:param value="{!name}" />
        </apex:outputText></h1><br />
        
        <apex:outputLabel for="name" value="{!$Label.Name}" />:
        <apex:inputText id="name" value="{!name}" /><br />
        
        <apex:commandButton action="{!submit}" value="{!$Label.Submit_Button}" rerender="greeting" />
      </apex:form>
    </apex:page>

## Example 3: Translastion

To enable the Translation Workbench, enter the Setup interface and configure your Translation Settings.

* In the Lightning Experience navigate to User Interface > Translation Workbench > Translation Settings.
* In Salesforce Classic navigate to Administer > Translation Workbench > Translation Settings.
* Quick Find "Translation Settings" works in either experience.

Click the Enable button if Translation Workbench is not already enabled.  
Add a Supported Language and select the Users to be the translators for this language and click Save. French will be used for this example.  

Click the Translate link and explore the various options. You will not find Custom Labels under the Setup Component picklist. The options for translating Custom Labels are on the Custom Label detail page. Modify your Custom Labels with the values below.


| Short Description | Name          | English Value | French Value |
|-------------------|---------------|---------------|---------------
| Greeting          | Greeting      | Hello, {0}!   | Bonjour {0}! |
| Name              | Name          | Name          | Nom          |
| Submit Button     | Submit_Button | Submit        | Soumettre    |
| Default Name      | Default_Name  | World         | Monde        |
| Code Word         | Code_Word     | Astro         |              |
| Special Name      | Special_Name  | Ohana         |              |

## Testing

Create a second user and set their laguage to French.  
Login as the new user.  
Navigate to /apex/LocalizationDemo and voilà!  

## Notes

* Translations should be done by professional translators, not a full time developer who took two years of French in High School.
