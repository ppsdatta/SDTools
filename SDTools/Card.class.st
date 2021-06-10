Class {
	#name : #Card,
	#superclass : #Morph,
	#instVars : [
		'text',
		'point',
		'close',
		'left',
		'right',
		'up',
		'down',
		'closeHandler',
		'leftHandler',
		'rightHandler',
		'upHandler',
		'downHandler'
	],
	#category : #SDTools
}

{ #category : #cards }
Card >> doClose [
	closeHandler value.
]

{ #category : #cards }
Card >> doDown [
	downHandler value
]

{ #category : #cards }
Card >> doLeft [
	leftHandler value
]

{ #category : #cards }
Card >> doRight [
	rightHandler value
]

{ #category : #cards }
Card >> doUp [
	upHandler value.
]

{ #category : #cards }
Card >> initialize [ 
	super initialize.
	self setupUi.
	
	
]

{ #category : #cards }
Card >> onClose: aBlock [
	closeHandler := aBlock
]

{ #category : #cards }
Card >> onDown: aBlock [
	downHandler := aBlock
]

{ #category : #cards }
Card >> onLeft: aBlock [
	leftHandler := aBlock
]

{ #category : #cards }
Card >> onRight: aBlock [
	rightHandler := aBlock

]

{ #category : #cards }
Card >> onUp: aBlock [
	 upHandler := aBlock
]

{ #category : #cards }
Card >> setupUi [ 
	self extent: (180@120).
	self color: (Color white).
	text := TextMorph new extent: ((self width - 20)@20).
	text contents: 'Blank card'.
	self addMorph: text.
	text left: (self left + 10).
	text top: (self top + 10).
	point := TextMorph new extent: (20@20).
	point contents: '0'.
	self addMorph: point.
	point left: (self left + (self width - 40)).
	point top: (self top + (self height - 40)).
	close := SimpleButtonMorph new label: 'X';
		extent: (20@20);
		color: Color red.
	self addMorph: close.
	close left: (self left + self width + 4);
		   top: self top.
	left := SimpleButtonMorph new label: '<-';
		extent: (20@20);
		color: Color green.
	self addMorph: left.
	left left: (self left + self width + 4);
		   top: self top + close height + 4.
	right := SimpleButtonMorph new label: '->';
		extent: (20@20);
		color: Color green.
	self addMorph: right.
	right left: (self left + self width + 4);
		   top: self top + close height + 4 + left height + 4.
	closeHandler := [Transcript show: 'Closed'].
	leftHandler := [Transcript show: 'Left'].
	rightHandler := [Transcript show: 'Right'].
	close target: self; actionSelector: #doClose.
	left target: self; actionSelector: #doLeft.
	right target: self; actionSelector: #doRight.
	up := SimpleButtonMorph new label: 'U';
			extent: (20@20);
			color: Color green.
	self addMorph: up.
	up left: (self left + self width + 4);
		top: self top + close height + left height + right height + 12.
	upHandler := [Transcript show: 'U'; cr].
	down := SimpleButtonMorph new label: 'D';
			extent: (20@20);
			color: Color green.
	self addMorph: down.
	down left: (self left + self width + 4);
		top: self top + close height + left height + right height + up height + 16.
	downHandler := [Transcript show: 'D'; cr].	
	up target: self; actionSelector: #doUp.
	down target: self; actionSelector: #doDown.


]
