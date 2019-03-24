# FourSquareProject

Code written in Swift 4.0
Programmed in Xcode 10.1

External dependencies 
- SwiftyJson
- AlamoFire

How to run?

- Download the repository
- Install SwiftyJson and AlamoFire into project workspace using Carthage or CocoaPods – 
install instructions for both are on the respective github repo’s. 
- https://github.com/SwiftyJSON/SwiftyJSON
- https://github.com/Alamofire/Alamofire 
- Build and run the project!

How to use the app?

-	Add the city name
-	Click search
-	Scroll through and observe the difference places listed in close proximity to the given location

My Approach?

- Initally went around interacting with the API and looking at the different variations within the nested JSON data
- Once I figured out the data I wanted to extract, I looked at making a structure that would hold all of the relevant data
- Next I looked at using Carthage to access AlamoFire - this would allow me to make a simple network connection and also access
to SwiftyJson which would allow me to extract the JSON response into a usable swift object.
- After this I looked at using a searchBar and tableView to print out the passed search results to tableViewCells 
- Lastly added constraints and colour theme.

What would I like to have added if I had more time?

- If I had a little more time and I could install Nimble and Quick, I would've liked to add a UnitTest on the expected
results on the value of the name, address and postal code. Would've hoped to write some mock data and to expect certain values 
to pass or fail based on the given value.
- Some validation on fields would've have been good - this would have stopped users from entering any data they wanted
also it would've been cheaper on server calls as we would have been able to validate input before making a call to the network.
- Would have liked to use DidSelectRow at - this would've allowed the user to be able to click into the place cell - to where 
the user would have taken to a new screen and they would be presented with extra details that were not presented on the
 TableViewCell.
 
 Hope you like this app! - It is a very simple interpreation of being able to access FourSquare API.
