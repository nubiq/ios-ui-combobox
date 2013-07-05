# Combo Box for iOS

## Included classes

* UIComboBox
* UIComboBoxSelector
* UITriangleView

## View

![Simple combo box.](/Documentation/ComboBox-Foreground.png "Combo box view")
![Combo box selector.](/Documentation/ComboBox-Selector.png "Combo box selector")
![Combo box selector with colors.](/Documentation/ComboBox-SelectorColors.png "Combo box selector using colors")

## Use

To see an example of how to use these classes, please, see the main ViewController class, in the path ios-custom-ui-elements/CustomElementsTest/CustomElementsTest/ViewController.m

For example, defining a UICustomRoundButton is as simple as:

``` objective-c
UIComboBox *comboBox = [[UIComboBox alloc] initWithFrame:CGRectMake(200, 100, 140, 40)
                                              withFather:self
                                         withTextOptions:[NSMutableArray arrayWithObjects:@"Option 1",@"Option 2", @"Option 3", nil]
                                       withDefaultOption:0];
```

To make it work with colors, then:

``` objective-c
UIComboBox *comboBox2 = [[UIComboBox alloc] initWithFrame:CGRectMake(400, 100, 140, 40)
                                               withFather:self
                                          withTextOptions:[NSMutableArray arrayWithObjects:@"Option 1",@"Option 2", @"Option 3", nil]
                                         withColorOptions:[NSMutableArray arrayWithObjects:[UIColor redColor], [UIColor blueColor], [UIColor yellowColor], nil]
                                        withDefaultOption:0];
```

# Development

## Author

* Noelia Sales <noelia@nubiq.es>