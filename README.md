# iOS-Bootcamp Final Project: The Study Timer

## Project Goal and Functions
The goal of this project is to make a usable study timer that helps user to better focus on a specific task.
This is a list of functions that this application has implemented. 
1. Be able to add or delete a specific task
2. Contains the progress bar so the users can get a percentage feedback of the tasks they have finished
3. Be able to offer some sentences to encourage users after they have finished certain amounts of task. The source of these sentences comes from an API.
4. Be able to set up a timer with a progress bar.
5. Displays multiple Views by using the Swift TabView.

## Swift Documentation References
1. SwiftUI TabView: https://developer.apple.com/documentation/SwiftUI/TabView
2. ForEach Syntax: https://developer.apple.com/documentation/swiftui/foreach
3. Overlay Syntax (Used by the function of "adding a specific task"): https://developer.apple.com/documentation/swiftui/view/overlay(alignment:content:)
4. Timer Function Syntax: https://developer.apple.com/documentation/foundation/timer/scheduledtimer(withtimeinterval:repeats:block:)
5. onChange Function (Used by displaying the API sentences): https://developer.apple.com/documentation/swiftui/view/onchange(of:initial:_:)-4psgg
6. Alert Syntax: https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:presenting:actions:message:)-8584l

## API Usage
API Link: https://docs.zenquotes.io/zenquotes-documentation/

## Obstacles and Future Improvements
During the API setup process, it did take some time to align the Codable section to the API requirements. Apart from current settings, there are several other improvements that could be done in the future. 
1. Implementing the User Notification function to let the user know that "time's up" instead of only using the Alert function.
2. Managing user data with SwiftData.
3. Using a progress ring to demonstrate the count-down timer instead of using a progress ring.
4. Improve UI design.
5. Add more functions to "todo list", like adding importance/time-needed/locations...

## Preview of StudyTimer
<p align="center">
  <img src="https://github.com/harry-w-0919/iOSBootCamp-StudyTimer/blob/main/img01.png" width="120"/>
  <img src="https://github.com/harry-w-0919/iOSBootCamp-StudyTimer/blob/main/img02.png" width="120"/>
  <img src="https://github.com/harry-w-0919/iOSBootCamp-StudyTimer/blob/main/img03.png" width="120"/>
  <img src="https://github.com/harry-w-0919/iOSBootCamp-StudyTimer/blob/main/img04.png" width="120"/>
  <img src="https://github.com/harry-w-0919/iOSBootCamp-StudyTimer/blob/main/img05.png" width="120"/>
  <img src="https://github.com/harry-w-0919/iOSBootCamp-StudyTimer/blob/main/img06.png" width="120"/>
</p>
