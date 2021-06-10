Class {
	#name : #Lane,
	#superclass : #Morph,
	#instVars : [
		'cards',
		'label',
		'addCard',
		'left',
		'right'
	],
	#category : #SDTools
}

{ #category : #lanes }
Lane >> add: aCard [
	cards add: aCard.
	self renderCards.
]

{ #category : #lanes }
Lane >> initialize [ 
	super initialize.
	cards := OrderedCollection new.
	left := right := nil.
	self setupUi.
]

{ #category : #lanes }
Lane >> leftLane: aLane [
	left := aLane
]

{ #category : #lanes }
Lane >> moveCard: aCard toLane: aLane [
	self removeCard: aCard.
	aLane newCard: aCard.
]

{ #category : #lanes }
Lane >> moveDown: aCard [
	|ind|
	
	ind := cards find: aCard.
	((ind > 0) and: (ind < cards size)) ifTrue: [
		|c1 c2 left top|
		
		c1 := cards at: ind.
		c2 := cards at: (ind + 1).
		
		left := c1 left.
		top := c1 top.
		
		c1 left: c2 left;
			top: c2 top.
			
		c2 left: left;
			top: top.
		
		cards at: ind put: c2.
		cards at: (ind + 1) put: c1.
	].
]

{ #category : #lanes }
Lane >> moveUp: aCard [
	|ind|
	
	ind := cards find: aCard.
	(ind > 1) ifTrue: [
		|c1 c2 left top|
		
		c1 := cards at: ind.
		c2 := cards at: (ind - 1).
		
		left := c1 left.
		top := c1 top.
		
		c1 left: c2 left;
			top: c2 top.
			
		c2 left: left;
			top: top.
			
		cards at: ind put: c2.
		cards at: (ind - 1) put: c1.
	].

]

{ #category : #lanes }
Lane >> newCard [
	| card |
	Transcript show: 'New card'; cr.
	card := Card new.
	self newCard: card.

]

{ #category : #lanes }
Lane >> newCard: aCard [
	| h |
	
	self addMorph: aCard.
	h := cards inject: (label height + 40) into: [:p :c | p + (c height) + 2].
	aCard top: self top + h;
		  left: self left + 10.
	cards add: aCard.
	aCard onClose: [
		self removeCard: aCard.
	].
	aCard onUp: [
		self moveUp: aCard.
	].
	aCard onDown: [
		self moveDown: aCard.	
	].
	aCard onLeft: [
		left ifNotNil: [
			self moveCard: aCard toLane: left 
		].
	].
	aCard onRight: [
		right ifNotNil: [
			self moveCard: aCard toLane: right 
		].
	].
]

{ #category : #lanes }
Lane >> removeCard: aCard [
	|ind|
		
	ind := cards indexOf: aCard.
	(ind > 0) ifTrue: [
		(cards size to: ind + 1 by: -1) do: [:i | 
			(cards at: i) top: (cards at: i - 1) top.
		].
	   	(ind to: cards size - 1) do: [:i | 
			cards at: i put: (cards at: i + 1).				
		].   
		cards removeIndex: cards size.
		self removeMorph: aCard.
	].
]

{ #category : #lanes }
Lane >> rightLane: aLane [
	right := aLane
]

{ #category : #lanes }
Lane >> setupUi [
	self extent: (200@400);
		color: (Color r: 0.878 g: 0.894 b: 0.806).
	label := TextMorph new extent: ((self width - 20)@20).
	label left: (self left) + 10;
		  top: (self top) + 10.
	label contents: 'Lane'.
	self addMorph: label.
	addCard := SimpleButtonMorph new extent: (20@20).
	addCard label: '+'.
	addCard left: (self left + (self width - 30));
			  top: (self top + 10);
			  color: Color yellow.
	addCard target: self; actionSelector: #newCard.
	self addMorph: addCard.
	
]
