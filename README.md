How to run the code

1.	Open MoviesChat.xcworkspace in Xcode
2.	Choose device
3.	Tap Play to build and run the project

Xcode Version 9.4.1
Deployment Target iOS 11.4

Explanation of architecture

Architecture pattern is MVVM. There are two screens: Movies and Comments.
Every entity have Model (Movie), View (MoviesViewController), ViewModel (MoviesViewModel). Other files are required for easy code reading. ViewModel is responsible for performing the entire logical part of the work and also working with data, and the View is responsible only for the display and for the user interface.

If I had more time, what would I like to improve?

•	I would work on the UI / UX design as well as on the smoothness of the animations.
•	Change UITextField for UITextView like in Telegram chat, when you type a text, it becomes in several lines.
•	Write unit and ui tests, if the customer wants.
•	Add auth
•	Use Core Data to keep latest data on device
•	Fix remaining bugs
