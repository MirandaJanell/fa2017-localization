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