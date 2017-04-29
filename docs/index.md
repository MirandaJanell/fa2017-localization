# Localization in Apex and Visualforce

## Instructions

Turn on Developer Mode  
Navigate to /apex/LocalizationEx  
Click the Create Page LocalizationEx link.  
Change the first line to `<apex:page controller="LocalizationExController">`  
Click the Save icon.  
Click the Create Apex class 'public with sharing class LocalizationExController' link.  

## Example 1

### Controller: LocalizationExController.cls

    public with sharing class LocalizationExController {
      public String name { get; set; }
      
      public LocalizationExController() {
        name = 'World';
      }
      
      public void submit() {
        // do some processing
      }
    }

### Page: LocalizationEx.page

    <apex:page controller="LocalizationExController">
      <apex:form>
        <h1>Hello, <apex:outputText value="{!name}" /></h1>
        <apex:outputLabel value="Name" />
        <apex:inputText value="{!name}" />
        <apex:commandButton action="{!submit}" value="Submit" />
      </apex:form>
    </apex:page>


## Example 2

### Labels

| Short Description         | Name           | Value      |
|---------------------------|----------------|------------|
| Greeting                  | Greeting       | Hello      |
| First Name Label          | LabelFirstName | First Name |
| Submit Button Label       | ButtonSubmit   | Submit     |
| Default Name              | DefaultName    | World      |
| Special Substitution Name | SpecialName    | Friend     |
| Code Word                 | CodeWord       | *****      |

### Controller: LocalizationExController.cls

    public with sharing class LocalizationExController {
      public String name { get; set; }
      
      public LocalizationEx2Controller() {
        name = System.Label.DefaultName;
      }
      
      public void submit() {
        if(String.isNotBlank(name) && name.equalsIgnoreCase(System.Label.CodeWord)) {
          name = System.Label.SpecialName;
        }
      }
    }

### Page: LocalizationEx.page

    <apex:page controller="LocalizationEx2Controller">
      <apex:form>
        <h1>{!$Label.Greeting}, <apex:outputText value="{!name}" /></h1>
        <apex:outputLabel value="{!$Label.LabelFirstName}" />
        <apex:inputText value="{!name}" />
        <apex:commandButton action="{!submit}" value="{!$Label.BtnSubmit}" />
      </apex:form>
    </apex:page>
