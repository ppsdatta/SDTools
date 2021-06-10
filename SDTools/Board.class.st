Class {
	#name : #Board,
	#superclass : #Morph,
	#instVars : [
		'lanes',
		'add',
		'name'
	],
	#category : #SDTools
}

{ #category : #boards }
Board >> initialize [ 
	super initialize.
	lanes := OrderedCollection new.
	self setupUi.
]

{ #category : #boards }
Board >> label: aText [
	name contents: aText
]

{ #category : #boards }
Board >> newLane [
	|lane w|
	
	lane := Lane new.
	w := lanes inject: 10 into: [:p :l | p + l width + 20].
	lane left: self left + w.
	lane top: self top + 10 + add height + 10.
	lanes add: lane.
	self addMorph: lane.
	(lanes size > 1) ifTrue: [
		lane leftLane: (lanes at: (lanes size - 1)).
		(lanes at: (lanes size - 1)) rightLane: lane.
	].
	 
]

{ #category : #boards }
Board >> setupUi [
	self extent: (400@300).
	self color: Color lightGray.
	name := TextMorph new contents: 'Board'.
	self addMorph: name.
	name extent: (self width - 20).
	name top: self top + 10;
			left: self left + 10.
	add := SimpleButtonMorph new label: '+';
		color: Color yellow.
	self addMorph: add.
	add extent: (20@20);
		left: self left + self width - 30;
		top: self top + 10.
	add target: self; actionSelector: #newLane.
	
	
]
