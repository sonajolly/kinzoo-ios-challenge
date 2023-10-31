# Overview
    The RNM Universe app is an iOS application that allows users to explore characters from the famous animated
    show "Rick and Morty." With this app, you can view a list of characters and access detailed information about
    each character. 

# Features
    - Character List: Browse a comprehensive list of characters from the Rick and Morty series. Each character card displays the character's name and picture.
    - Character Details: Get detailed information about a specific character by clicking on their card. The details include the character's name, picture, status, species, and a list of episodes in which they appear.
    - Pagination: The app supports pagination, allowing you to load additional characters as you scroll through the list.
    - Pull to Refresh: Refresh the character list to fetch the latest data from the server.
    - Offline Support: Access previously loaded character data even when you're offline.

# Dependencies
    The RNM Universe app relies on the following technologies and libraries:
        - Swift: The app is built using Swift, a powerful and intuitive programming language for iOS app development.
        - UIKit: Apple's UIKit framework is used to create a user-friendly interface for the app.
        - Cocoapods: Cocoapods is employed for managing third-party library dependencies, ensuring a clean and efficient project structure.
        - Async Image Loading Library: The app integrates a well-known async image loading library called SDWebImage to optimize the loading of character images. SDWebImage is a widely recognized library that simplifies the process of downloading and caching images, making it ideal for populating image views in your iOS app. Here are some key benefits and features:

# Usage
    - Character List: Upon launching the app, you will be presented with a list of characters from the Rick and Morty series. Each character card displays the character's name and picture.
    - Character Details: To view detailed information about a character, simply click on the character's card in the list. The details include the character's name, picture, status, species, and a list of episodes in which they appear.
    - Episode List: Episodes are listed in the Character detail screen.
    - Pagination: As you scroll through the list of characters, additional characters will be automatically loaded to provide a seamless browsing experience.
    - Pull to Refresh: If you want to fetch the latest data, use the "Pull to Refresh" feature. It will update the character list with the most recent information from the server.
    - Offline Support: The app offers offline support, so you can access character data even without an internet connection. Previously loaded data is available for your convenience.

# Unit Tests and UI Tests
    The project includes a suite of unit and UI tests to ensure the reliability and correctness of the code. These 
    tests are implemented using XCTest, the built-in testing framework in Xcode. The primary focus of unit testing 
    is verify the behavior of the CharacterViewModel and associated components.
    
# Offline Support
    The project is designed to provide offline support for character data. This means that even if the user's
    device loses internet connectivity, the app can still display previously fetched character information.
    Offline support is achieved through local file storage. Character data fetched from the API is stored in local
    files using the FileManager in iOS. This data is encoded and saved in a JSON file named "characters.json"
    located in the app's document directory. When the app needs character information while offline or whenever
    the API fails due to any error, it retrieves this data from the local file.

# Decoupled Navigation
    In this project, decoupled navigation is achieved by handling navigation-related logic in the view model. This
    means that the view controller's primary responsibility is to manage the user interface and react to user
    interactions, while the view model takes charge of navigation flows and actions. By moving navigation logic to
    the view model, I ensured a clear separation of concerns. The view model focuses on data management, business
    logic, and interaction with the service layer, while the view controller remains responsible for rendering the
    UI.

# Pagination
    Added paginated loading in character list view for better performance.
    
# Pull to Refresh
    Pull to refresh added in character list view to get the updated data.
