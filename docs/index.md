#Localization in Apex and Visualforce

Page 1
<code>
<apex:page>
  <apex:form>
    <h1>Hello, <apex:outputText value="{!name}" /></h1>
    <apex:outputLabel value="Name" />
    <apex:inputText value="{!name}" />
    <apex:commandButton action="{!submit} value="Submit" />
  </apex:form>
</apex:page>
</code>

Controller 1
<code>
public class Controller1 {
  public String name { get; set; }
  
  Controller1 {
    name = 'World';
  }
  
  public void submit() {
    // do some processing
  }
}
</code>
