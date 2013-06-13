Matchismo
=========

Stanford CS193p class projects 1, 2 and 3

Assignment I: Matchismo



Objective

This assignment extends the card matching game Matchismo we started last week to get experience understanding MVC, modifying an MVC’s View in Xcode, creating your own actions and outlets, interacting with UILabel, UIButton and other iOS 6 SDK elements, and generally getting more experience with Xcode and Objective-C.
Be sure to check out the Hints section below! 



Materials

• You will need to have completed last week’s assignment before starting this one (at least the walkthrough portion of it).

• You will also need the lecture slides from Tuesday’s lecture.

• The slides for all lectures can be found in the same place you found this document.



￼￼Required Tasks:

1. Follow the detailed instructions in the lecture slides (separate document) to reproduce the latest version of Matchismo we built in lecture (i.e. the one with multiple cards) and run it in the iPhone (normal, non-Retina, non-iPhone 5) Simulator. Do not proceed to the next steps unless your card matching game functions as expected and builds without warnings or errors.

2. Add 4 cards to the game (for a total of 16).

3. Add a text label somewhere which desribes the results of the last flip. Examples: “Matched J♥ & J♠ for 4 points” or “6♦ and J♣ don’t match! 2 point penalty!” and simply “Flipped up 8♦” if there is no match or mismatch.

4. Add a button called “Deal” which will re-deal all of the cards (i.e. start a new game). It should reset the score (and anything else in the UI that makes sense). In a real game, we’d probably want to ask the user if he or she is “sure” before aborting the game in process to re-deal, but for this assignment, you can assume the user always knows what he or she is doing when they hit this button.

5. Drag out a switch (UISwitch) or a segmented control (UISegmentedControl) into your View somewhere which controls whether the game matches two cards at a time or three cards at a time (i.e. it sets “2-card-match mode” vs. “3-card-match mode”). Give the user appropriate points depending on how difficult the match is to accomplish.

6. Disable the game play mode control (i.e. the UISwitch or UISegmentedControl from Required Task #5) when flipping starts and re-enable it when a re-deal happens (i.e. the Deal button is pressed).

7. Make the back of the card be an image (UIImage) rather than an Apple logo.



￼￼Hints:

These hints are not required tasks. They are completely optional. Following them may make the assignment a little easier (no guarantees though!).

1. NSString’s stringWithFormat: method will be very helpful.

2. Don’t forget that NSString constants start with @. Constants without out the @ (e.g.
“hello”) are const char * and are rarely used in iOS.

3. Think carefully about where the code to generate the strings in Required Task #3 above should go. Is it part of your Model, your View, or your Controller? Some combination thereof? Justify your decision in comments in your code. A lot of what this homework assignment is about is your understanding of MVC.

4. You might be interested in the NSArray method componentsJoinedByString:. It turns an array into a string (with the given string separating each component in the array). If you don’t have a use for this, don’t worry.

5. You will have to read the documentation for UISwitch and/or UISegmentedControl to figure out how to use them. A switch is probably (a little bit) easier to understand, but a segmented control is probably more appropriate to the task. Being able to figure a class out solely from its documentation is crucial to being a good iOS developer. That’s what that Required Task is about.

6. The logic in your Model to will have to be configurable for the two different game play modes. And your PlayingCard class will also have to know how to match itself against two other cards (it already knows how to match itself against one other card).

7. You might have to make your cards a bit shorter to fit all of the UI required in this assignment.

8. You can feel free to adjust the scoring of 2-card-match mode if you want it to be consistent with your 3-card-match mode’s scoring. In other words, consider the difficulty of matching 2 out of 2 cards of the same suit (medium) versus 2 out of 3 (easy) or 3 out of 3 (hard).

9. Setting the background image of a selectable UIButton is tricky to do directly in Xcode (i.e. in the Inspector) since if you have not set an image for the Selected state, then the Normal image will also appear when the button isSelected (which is probably not what you want). Setting the image for the appropriate state conditionally in code is probably simpler (it can be done in 2 lines of code in your updateUI).

10. You’ll need this method below which creates an image object suitable for setting as the UIButton’s image for a given state (i.e., using UIButton’s setImage:forState: method). All you need to do to make this line of code work is to drag a cardback.png (jpeg also works) file into your project’s Navigator:
UIImage *cardBackImage = [UIImage imageNamed:@"cardback.png"];

11. Depending on what the image you are trying to use for your card back looks like, you might want to check out UIButton’s imageEdgeInsets property to make your image fit inside the rounded rect of the button better. The C function UIEdgeInsetsMake() will make things a snap when it comes to setting the value of imageEdgeInsets. This might also make you more comfortable with C structs if you don’t have a lot of experience with them (since UIEdgeInsets is a C struct).

12. Economy is valuable in coding: the easiest way to ensure a bug-free line of code is not to write the line of code at all. This assignment requires more lines of code than last week, but still not an excessive amount. So if you find yourself writing many dozens of lines of code, you are on the wrong track.


=========


Assignment II: Set



Objective:

In this assignment, you will enhance your solution from Assignment 1 to add a second card game, Set, to your card matching game.

Be sure to check out the Hints section below! 



Materials:

• You will have to have succesfully completed Assignment 1 and use it as a code base for this assignment.

• Check out how to play Set. You will not have to implement the full rules, but you should understand the conditions under which 3 cards make a Set and what a deck of Set cards consists of.



￼￼Required Tasks

1. Add a tab bar controller to your application. One tab will be the game you built last week in Assignment 1. The other tab will be a new game, Set. Set is still a card game, so a good solution to this assignment will use object-oriented programming techniques to share a lot of code.

2. Don’t violate any of the Required Tasks from Assignment 1 in the playing card game tab (in other words, don’t break any non-extra-credit features from last week). The only exception is that your playing card game is required to be a 2-card-match-only game this week, so you can remove the switch or segmented control you added for Required Task #5 in Assignment 1. Your Set game is a 3-card matching game.

3. The Set game only needs to allow users to pick sets and get points for doing so (e.g. it does not redeal new cards when sets are found). In other words, it works just like your other card game (except that it is a 3 card (instead of 2 card) match with different kinds of cards).

4. Choose reasonable amounts to award the user for successfully finding a set (or incorrectly picking cards which are not a set).

5. Your Set game should have 24 cards.

6. Instead of drawing the cards in the classic form (we’ll do that next week), we’ll use these three characters ▲ ● ■ and use attributes in NSAttributedString to draw them appropriately (i.e. colors and shading).

7. Your Set game should have a Deal button, Score label and Flips label just like your playing card matching game from Assignment 1 does.

8. Your Set game should also report (mis)matches like Required Task #3 in Assignment 1, but you’ll have to enhance this feature (to use NSAttributedString) to make it work for displaying Set card matches.



￼￼Hints

These hints are not required tasks. They are completely optional. Following them may make the assignment a little easier (no guarantees though!).

1. Don’t forget that you can specify alpha when you create a text color for a character in an NSAttributedString. That’s a good way to do “shading.”

2. It might help to think of Set cards as having the symbols on both sides of the card, but the front side having a different background color or something than the back side (so you can visually see when it has been chosen). Having a Set game where you can’t see the symbols until you flip the card over (like in our playing card game) might make it prohibitively difficult (plus that’s not the way Set is played and you are supposed to have investigated how Set is played as part of this assignment).

3. You might not want your Set game’s cards to have rounded rects around them (i.e. they could have no border if you want, just the symbols on the card). To get rid of the rounded rect around a button, change the button’s type to the Custom type (just choose this in the Attributes Inspector for a UIButton instead of the Rounded Rect type) for your Set game’s cards.

4. Setting the background color of a Rounded Rect button doesn’t really make a lot of sense (it’s not the interior area of the rounded rect, it’s the exterior area). But setting the background color of a Custom button makes a lot of sense.

5. Once a set is found, you can use alpha to fade the button out (like we did in Assignment 1) or just clear out the set completely (i.e. cards in the Set game can be blank after they’ve been matched). It’s hard enough for the user to get their minds around which cards match without the distraction of already-matched cards still visible (even if faded out).

6. The bonus for matches and penalty for mismatches were hardwired into your Controller in Assignment 1, but you’ll want to make them parameterizable for Assignment 2 since you have 2 different games with different scoring.

7. Your Model is UI independent, so it cannot have NSAttributedStrings with UI attributes anywhere in its interface or implementation. Any attribute defined in UIKit is a UI attribute (obvious ones are those whose values are, for example, a UIColor or a UIFont). All the attributes discussed in lecture were UI attributes. While it would theoretically be legal to have an NSAttributedString without UI attributes in your Model, it is recommended you not do that for this assignment. Just use NSAttributedString to draw beautiful strings in your UI.

8. If you violated MVC in your solution to Required Task 3 of Assignment 1, then Required Task 8 in this assignment will be more difficult (that’s why you shouldn’t have violated MVC!) and you’ll probably want to go back and redo Required Task 3 of Assignment 1 with better MVC separation before doing Required Task 8 in this assignment.

9. Speaking of Object-Oriented Programming, you’ll want to use it to good effect in this assignment. You have two Controllers which share a lot of functionality. What do we do in OOP when we want to share functionality?

10. If you subclass a subclass of UIViewController, you can wire up to the superclass’s outlets and actions simply by opening up the superclass’s code in the Assistant Editor in Xcode (side-by-side with the storyboard) and ctrl-dragging to it as you normally would. In other words, you are not required to make a superclass’s outlets and actions public (by putting them in its header file) just to wire up to them with ctrl-drag. If you want to send messages to the outlet in the subclass’s code, though, you would obviously have to make the outlet public (it is good object-oriented design, however, to try to keep as much private as possible and only make public what is essential to the use or subclassing of a class--it is quite possible to implement this entire assignment without making a single outlet or action public).

11. There is no concept like “protected” in Objective-C. Unfortunately, if a subclass wants to send messages to its superclass in code (again, not with ctrl-drag), those methods (including properties) will have to be made public. Again, a good object- oriented design usually keeps publication of internal implementation to a minimum!

12. All methods (including properties) are inherited by subclasses regardless of whether they are public or private. And if you implement a method in a subclass, you will be overriding your superclass’s implementation (if there is one) regardless of whether the method is public or private. As you can imagine, this could result in some unintentional overrides, but rarely does in practice.

13. If you copy and paste an entire MVC scene in your storyboard (not the components of it piece-by-piece, but the entire thing at once), all the outlets and actions will, of course, be preserved. Even if you then change the class of the Controller in one of the scenes, as long as the new class implements those outlets and actions (for example, by inheritance), the outlets and actions will continue to be preserved.

14. As you start working with multiple MVCs in a storyboard, you might get yourself into trouble by accidentally changing the name of an action or outlet or making a typo or otherwise causing your View to send messages to your Controller that your Controller does not understand. Remember from the first walkthrough of this course that you can right click on any object in your storyboard to see what it is connected to (i.e. what outlets point to it and what actions it sends) and you can also disconnect outlets and actions from there (by clicking the little X’s by the outlets and actions). If you are getting crashes that complain of messages being sent to objects that don’t respond to that message (sometimes a method is referred to by the term “selector” by the way), this might be something to check.


=========


Assignment III: Graphical Set



Objective:

You will use your knowledge of the card matching games from the past two weeks combined with your newfound skills at creating custom UIView subclasses and using UICollectionView to build better versions of Set and the Playing Card matching games that look (and in the Set case, play) more like the real thing. Finally, you will also need to familiarize yourself enough with Autolayout to make your UI autorotate properly.

There’s lots of Extra Credit this week, so if it fits in your schedule, this is a good week to bank some.

This assignment is due by the start of lecture next Tuesday. Be sure to check out the Hints section below!



Materials
• You can modify your existing Matchismo or you can start fresh, but you will almost certainly want to use your Model from Assignment 2 (though it will require some minor modification). Your Controllers for this week will bear some resemblance to last week’s, but there’s a lot new here.
• By now, you should know how the Set game works. We will implement more of the rules (for a solo game anyway) this time.
• You are welcome to use any code that was written during demonstrations in lecture.



￼￼Required Tasks:

1. Create an application that plays both the Set game (single player) in one tab and the Playing Card matching game in another.

2. You must use polymorphism to design your Controllers for the two games (i.e. you must have a (probably abstract) base card game Controller class and your Set game and Playing Card game Controllers must be subclasses thereof).

3. For Set, 12 cards should be initially dealt and Set cards should always show what’s on them even if they are technically “face down”. For the Playing Card game deal 22 cards, all face down.

4. The user must then be able to choose matches just like in last week’s assignment.

5. When a Set match is successfully chosen, the cards should be removed from the game (not just blanked out or grayed out, but actually removed from the user-interface and the remaining cards rearranged to use up the space that was freed up in the user- interface).

6. Set cards must have the “standard” Set look and feel (i.e. 1, 2 or 3 squiggles, diamonds or ovals that are solid, striped or unfilled, and are either green, red or purple). You must draw these using Core Graphics and/or UIBezierPath. You may not use images or attributed strings. Use the PlayingCardView from the in-class demo to draw your Playing Card game cards.

7. In the Set game (only), the user must always have the option somewhere in the UI of requesting 3 more cards to be dealt at any time if he or she is unable to locate a Set.

8. Automatically scroll to show any new cards when you add some in the Set game.

9. Do something sensible when no more cards are in the deck and the user requests more.

10. If there are more cards than will fit on the screen, simply allow the user to scroll down to see the rest of the cards. Pick a fixed (and reasonable) size for your cards and keep them that size for the whole game.

11. It is very important that you continue to have a “last flip status” UI and that it show not only matches and mismatches, but also which cards are currently selected (because there can be so many cards now that you have to scroll to get to all the cards in a match). A UILabel may no longer be sufficient for this UI.

12. The flip counter can be removed from the game. You must still show the score, however.

13. The user should still be able to abandon the game and start over with a fresh group of cards at any time (i.e. re-deal).

￼14. The game must work properly (and look good) in both Landscape and Portrait orientations on both the iPhone 4 and the iPhone 5. Use Autolayout to make this work (not struts and springs).



￼￼Hints:

These hints are not required tasks. They are completely optional. Following them may make the assignment a little easier (no guarantees though!).

1. If you used inheritance to design your Controllers last week, the polymorphism part of the assignment will be a breeze. If you did not, then this is a skill you must master. Hopefully your OOP skills are such that you know what polymorphism is, but suffice it to say, you must have a base Controller class which encapsulates as much as possible that is conceptually in common between the Set game and the Playing Card game and this base class must have public API for the subclasses to override to provide game-specific behavior. Each of the two tabs in your application will have a Controller which is a (different) subclass of this shared base Controller class.

2. If you designed your Model to be highly specific to last week’s assignment (maybe you specified specific color or shape names in the Model’s API, for example, instead of just saying colors 1 2 3 and shapes 1 2 3), you’ll have to go back and fix it. Hopefully this will give you an appreciation for designing reusable, extensible API. A lot of good API design is taking time to think “how might someone want to use this in the future?” It would not have been a stretch to think that someone would want to use different colors or use shapes other than triangle, circle and square (the latter especially since you knew those weren’t the normal shapes and that we were just doing that because that’s all NSAttributedString could do for us). It is understandable if you hardwired these “appearances” into your Model, by the way, especially if you have really only been asked to program for “homework” in CS classes (which usually ask you to do a specific thing and often don’t care if your API is extensible). You will not be docked for doing that this time either, but hopefully the experience will stay with you when you go out into the “real world.”

3. You will need to enhance your CardMatchingGame, but not that much ...

4. Since cards can now be added to an existing game, your CardMatchingGame will have to hold onto the deck it was created with, have public API to cause more cards to be put in play from that deck, and have public API to let anyone who’s interested know how many cards are currently in play.

5. Matches now result in the removal of cards. One could make the argument for the responsibility for this removal being either in the CardMatchingGame (automatically remove matched cards) or in the Controller (remove cards involved in matches on the last flip) depending on whether you think it’s part of the “game play” or is just a “visual thing” to remove the cards. The latter (having an API in your Model for deleting cards from the game and letting the Controller decide when to do this) turns out to be easier to implement (especially if you are doing the deletion animation extra credit), so you are welcome to choose this architecture.

6. The Extra Credit to animate the removal of cards might also benefit from a reverse indexOfCard: method (not in all solutions, but in some).

7. As always, you will get a lot from the in-class demonstrations from the last two lectures (in this case, custom UIView and UICollectionView). You are allowed to use the code from those (but if you want to learn this stuff, be sure you’re understanding it as you incorporate it into your homework solution).
