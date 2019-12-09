# Outdoor I/O
![logo](https://github.com/mecharmor/CSC690-IOS-APP/blob/master/mockups/logo.png)

## What's Outdoor I/O?
 - This is an IOS App Developed in Xcode `8.0`, IOS Version `12.0` and Swift Version `4.2`
 - The purpose of this app is to provide offline usability for users who hike/hunt in remote locations that do not have internet connection
 - Users have the ability to take photos of their adventures while the app handles the location/pathing of each photo taken.

## Team Members
- Cory Lewis
- Roderic Kong

# Getting Started
> On Mac **ONLY**
```
Shortcut: [Command + Space] to open Spotlight search
Type: Terminal
Click: Terminal App 
From Terminal type: git clone https://github.com/mecharmor/CSC690-IOS-APP
From Finder: Open project folder
From Terminal type: pod install
From Finder: Double click on .xcodeproj file
```

### Getting Started Extra Notes
```
(After clicking .xcodeproj file....)
if on the top left, you see a something like "Base sdk missing"
Double click on the first item in the three
Go to tag build
Select a sdk for the Base SDK
Close the opened popup
Click on build an run
If you have error, you should see a red icon on the right bottom
```

## Features
- Must Have Features ❌
    - Persistent Data Storage ✔
    - Take Photos With Device Camera ✔
    - Save Photos in persistent Data Storage ✔
    - Fetch GPS Coordinates and Save in Persistent storage ✔
    - Display all pins containing saved locations for trip ❌
    - Display History of all trips taken ❌
    - Use **Core Location to path** (https://developer.apple.com/documentation/corelocation) ✔
    - Display map containing all pins from selected trip ❌
    - Shall allow users to view previous trips ❌
    - About Page  ❌
- Nice to Have Features
    - Users shall be able to view all photos taken on previous trips ❌
    - If user closes app the app shall cache the current trip so progress is not lost ❌
    - path drawn from all pins to show user the trip they took ❌
    - user shall have the ability to preview photos from their current trip ❌
    - Add Settings options for user such as ❌
        - clear trips ❌
        - export photos to use elsewhere? ❌

## Outdoor I/O Mockups
<img src="https://github.com/mecharmor/CSC690-IOS-APP/blob/master/mockups/drawing.jpg" alt="" width="300px" height="auto">
<img src="https://github.com/mecharmor/CSC690-IOS-APP/blob/master/mockups/menu.png" alt="" width="300px" height="auto">
<img src="https://github.com/mecharmor/CSC690-IOS-APP/blob/master/mockups/menu_2.png" alt="" width="300px" height="auto">
<img src="https://github.com/mecharmor/CSC690-IOS-APP/blob/master/mockups/history.png" alt="" width="300px" height="auto">
<img src="https://github.com/mecharmor/CSC690-IOS-APP/blob/master/mockups/menu_color.png" alt="" width="300px" height="auto">
<img src="https://github.com/mecharmor/CSC690-IOS-APP/blob/master/mockups/history_pin_details.png" alt="" width="300px" height="auto">
<img src="https://github.com/mecharmor/CSC690-IOS-APP/blob/master/mockups/" alt="" width="300px" height="auto">

## Feedback
For any other questions about this repo in general please reach out to [**@mecharmor**](https://github.com/mecharmor) on Github. <br>
PS: Feel free to fork it if you find App site interesting.



> Updated on: 11/08/19, Cory Lewis
