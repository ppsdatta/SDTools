Class {
	#name : #BoardCollection,
	#superclass : #Morph,
	#instVars : [
		'boards',
		'name'
	],
	#category : #SDTools
}

{ #category : #'as yet unclassified' }
BoardCollection class >> list [
	^ BoardStore instance list
]

{ #category : #'as yet unclassified' }
BoardCollection class >> open: aName [
 	(BoardStore instance get: aName) openInWorld 
]
