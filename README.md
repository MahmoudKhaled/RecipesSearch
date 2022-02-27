## Building and running the project (requirements)
* Swift 5.0
* Xcode 13.1+
* iOS 12.0+

## Setup Configs
- Checkout master branch to run latest version
- Open the terminal.
- Navigate to the project root directory.
- run this commend to install all pods "pod install".
- Open the project by double clicking the `RecipesSearch.xcworkspace` file
- Select the build scheme which can be found right after the stop button on the top left of the IDE
- [Command(cmd)] + R - Run app


## Architecture
- This application uses the View-Interactor-Presenter-Entity-Router (refered to as VIPER) architecture,
    the main purpose of the VIPER is separating the view logic from the data model logic. Only the presenter talks to the view, and only the interactor talks to the model (entity). The presenter and interactor coordinate with each other. The presenter is concerned with display and user action, and the interactor is concerned with manipulating the data.The router handles navigation between screens.
 
 - This application use network layer which build on 'Alamofire', so you can call APIs and parse response in an easy way.

## Scenes:
* Group of app scenes: 
- 1 - Recipes -> to search for recipe name or food ingredien.
- 2- RecipeDetails -> to display selected recipe details

## About:
-  Enter recipe name or food ingredien in the search bar, when tab search button you should see a list view of recipes data each one of it contain Recipe’s image - Recipe’s title - Recipe’s Source , Recipe’s health labels), can filter data with health filter type such (keto, vegan or low sugar) and selet all of types .
- Only english letters & spaces are allowed to be inserted in the search bar, so you can't insert numbers or special letters in search bar.
- When select reipe row navigate to recipe's details which contain Recipe’s image, Recipe's title and Recipe ingredients.
- Website button open recipe's page in `SFSafariViewController`.
- Share button to share recipe's url to the available sharing options on the device.


