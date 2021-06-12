# SDTools
A set of tools built with Smalltalk (Squeak + Morphic)

## A very simple Kanban board

It consists of the following classes - `Card`, `Lane`, `Board`, `BoardStore` and a `BoardCollection`.

* `Card` - The smallest unit of work. It title and points can be edited.
* `Lane` - The container of cards. Lanes can have titles. Cards in the lanes can be moved up, down or across lanes.
* `Board` - A collection of lanes.
* `BoardStore` - A simple store to save boards within the Squeak image by its name. Essentially it had a class variable that stores a dictionary of name => Board records.
Each time you make a change to a Board, the image needs to be saved in order for the store to keep the records saved. This class is used as a singleton object from `BoardCollection`.
* `BoardCollection` - a convenient class that has apis to create a new board with a name or reopen a board that is saved. Internally it wires the board store class to do all these work.

Issues: No scrollable lanes! If it grows too long it will not be visible any more. Also, no moving cards across boards as of now.

