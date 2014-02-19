# Combo Box for iOS 7

## Included classes

* NQComboBox
* NQComboBoxSelector
* NQTriangleView

## View

![Simple combo box.](/Documentation/ComboBox-Foreground.png "Combo box view")

![Combo box selector.](/Documentation/ComboBox iOS 7-Selector 1.png "Combo box selector example 1")

![Combo box selector with colors.](/Documentation/ComboBox iOS 7-Selector 2.png "Combo box selector example 2")

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
* Abrahanfer <abrahan@nubiq.es>
