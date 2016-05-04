# Representatives

### Level 2

Students will build an app to get the representives (law makers) in a user-requested state to practice asyncronous network requests, working with JSON data, closures, and intermediate table views.

Students who complete this project independently are able to:

* use NSURLSession to make aysncronous network calls
* parse JSON data and generate model object from the data
* use closures to execute code when an asyncronous task is complete
* build custom table views

### Implement Model

##### Create a `Representative` model class that will hold the information of a representative to display to the user.

1. Create a `Representative.swift` class file and define a new `Representative` class.
2. Go to a sample endpoint of the [Who is my Representative](http://whoismyrepresentative.com) API and see what JSON (information) you will get back.
3. Using this information, add properties on `Representative`.
    * `let name: String`
    * `let party: String`
    * `let state: String`
    * `let district: String`
    * `let phone: String`
    * `let office: String`
    * `let link: String`
4. Create a failable initializer method with a parameter of a JSON dictionary (`[String: AnyObject]`. This is the method you will use to initialize your `Representative` object from the JSON dictionary. Remember to use a sample endpoint to inspect the JSON you will get back and the keys you will use to get each piece of data.

### Network Controller

##### Create a `NetworkController` class. This will have methods to build the different URLs you might want and it should have a method to return NSData from a URL. Build the `NetworkController` to be reusable in future projects.

1. Write a function that will take an `NSURL` and a completion closure. The parameter of the completion closure should be of type `NSData?` and the closure should return `Void`. This method will make the network call and call the completion closer with the `NSData?` result. If successful, `NSData?` will contain the response, if unsuccessful, `NSData?` will be nil. The class or function that calls this function will need to handle nil data.
2. Use a Playground to test your network controller method with a sample endpoint from the [Who is my Representative](http://whoismyrepresentative.com) API to see if you are getting data returned.

As of iOS 9, Apple is boosting security and requiring developers to use the secure https protocol. For this API, you must have a paid API account to use https. For the sake of this app and learning, we will turn off this security feature. 

The error message should describe the issue about App Transport Security blocking a cleartext HTTP. A workaround to Apple's requirements is to add a key-value pair to your Info.plist. This key-value pair should be: App Transport Security Settings : [Allow Arbitrary Loads : YES].

### Representative Controller

##### Create a `RepresentativeController` class. This class will use the `NetworkController` to fetch data, and will serialize the results into `Representative` objects. This class will be used by the view controllers to fetch Representative objects through completion closures.

1. The `RepresentativeController` should have some static constant that represents the `baseURL` of the API.
2. Write a function `searchURLForState` that will take in a search term (the solution code uses a state abbreviation) and return an `NSURL` endpoint to the URL that will return the desired JSON for the entered state.
3. Add a method `searchRepsByState` that allows the developer to pass in the search parameter and, through a completion closure, provide an array of `Representative` objects.
    * This method should use the `searchURLForState` function to get the complete NSURL.
    * This method should call the NetworkController's `performRequestforURL` method to get the NSData at the URL created in the previous bullet point.
    * In the closure of the `performRequestforURL`, use a guard to check for nil NSData, and to unwrap the array of `[String: AnyObject]` dictionaries that hold Representative data. You will need to use the `try?` keyword to use `NSJSONSerialization` to serialize the `NSData`.
    * If the guard fails, print an error message to the console and run the completion with an empty array.
    * If the NSData can be serialized, create a `Representative` objects and call the completion closure with the populated array. (Hint: Use a for loop or `flatMap` to iterate through the dictionaries and initialize a new array of `Representative` objects.)

Note: There are many different patterns and techniques to serialize JSON data into Model objects. Feel free to experiment with different techniques to get at the `[String: AnyObject]` dictionaries within the NSData returned from the NSURLSessionDataTask. 

At this point you should be able to pull data for a specific state and serialize a list of Representatives. Test this functionality with a Playground or in your App Delegate by trying to print the results for a state to the console.

### View Hierarchy Notes

You will implement a 'Master-Detail' view hierarchy for this application. 

Your Master View is a list of states. Selecting any state will segue to a Detail View displaying a list of representatives for the selected state.

Recognize that even though the list of representatives may be called a List view, it is also considered a Detail view in this project, because it is the Detail view of the selected state.

### State List View Controller

Build a view that lists all states. Use the included `StateController.states()` variable to build the datasource for the UITableViewController. This view will be used to segue to a list of Representatives for the selected state.

1. Add a `UITableViewController` as your root view controller in Main.storyboard and embed it into a `UINavigationController`
2. Create an `StateListTableViewController` file as a subclass of `UITableViewController` and set the class of your root view controller scene
3. Implement the UITableViewDataSource functions using the included `StateController` states array
4. Set up your cells to display the name of each state

### State Detail View Controller

Build a view that lists all of the Representatives for a selected state. Use a UITableViewController and a custom UITableViewCell that displays the properties of a Representative (name, party, state, district, phone, and url). 

The State List View Controller will pass a State string to this scene. We will use that value to perform the network request. When the network request is completed, you will reload the UITableView to display the results.

1. Add an additional `UITableViewController` scene to the Storyboard. Create a class file `StateDetailTableViewController.swift` and assign the class to the storyboard scene.
2. Create a prototype cell that uses a Stack View to display the name, party, district, website, and phone number of a `Representative`. 
3. Create a custom `UITableViewCell` class with an `updateWithRepresentative` function that sets the labels to the `Representative` data.
2. Add a property of type `[Representative]` that will be used to populate the Table View. Set it to an empty array to satisfy the requirement that all properties have values upon initialization. 
3. Add an optional `state` property of type `String`. This will be set by the `StateListViewController` in the `prepareForSegue` function.
4. Update your `viewDidLoad` function to call the `RepresentativeController.searchRepsByState` function using the unwrapped state property. In the completion closure, set `self.stateRepresentatives` to the returned representatives and reload the UITableView on the main thread.
5. Implement the UITableViewDataSource functions to return your custom prototype, use the `updateWithRepresentative` function to display the correct `Representative` data on each cell.

Note: It is good practice to let the user know that a network request is processing. This is most commonly done using the Network Activity Indicator in the status bar. Look up the documentation for `networkActivityIndicatorVisible` property on `UIApplication` to turn on the indicator when the view loads, and turn it off when the network call is complete.

### Wire Up the Views

Set up a segue from the State List View to the State Detail View that assigns the state that the State Detail View should load Representatives for.

1. Add a segue from the prototype cell on the `StateListTableViewController` scene to the `StateDetailTableViewController` and assign an identifier.
2. Implement the `prepareForSegue` function on the `StateListTableViewController` class to capture the state and assign it to the `destinationViewController`'s `state` property.

### Black Diamonds

* Notice how after tapping the search button, the app hangs and doesn't do anything while the network call is being performed. Give visual feedback to the user that the search is being conducted.
* Implement another way for users to find their Congressman/Congresswoman.
* If no Represenatives were "found", notify the user that a search failed.
* Make the phone, office, and website labels links that would call, open a map view, and open a web view.

## Contributions

Please refer to CONTRIBUTING.md.

## Copyright

© DevMountain LLC, 2015. Unauthorized use and/or duplication of this material without express and written permission from DevMountain, LLC is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to DevMountain with appropriate and specific direction to the original content.