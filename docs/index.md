# Localization in Apex and Visualforce

## Example 1

### Page 1

```
<apex:page>
  <apex:form>
    <h1>Hello, <apex:outputText value="{!name}" /></h1>
    <apex:outputLabel value="Name" />
    <apex:inputText value="{!name}" />
    <apex:commandButton action="{!submit}" value="Submit" />
  </apex:form>
</apex:page>
```

### Controller 1

``` apex
public class Controller1 {
  public String name { get; set; }
  
  public Controller1 {
    name = 'World';
  }
  
  public void submit() {
    // do some processing
  }
}
```
