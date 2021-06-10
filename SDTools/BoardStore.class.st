Class {
	#name : #BoardStore,
	#superclass : #Object,
	#instVars : [
		'boards'
	],
	#classVars : [
		'Instance'
	],
	#category : #SDTools
}

{ #category : #'as yet unclassified' }
BoardStore class >> instance [
	Instance isNil ifTrue: [Instance := BoardStore new]. 
	^ Instance.
]

{ #category : #'as yet unclassified' }
BoardStore >> at: aName put: aBoard [
	boards at: aName put: aBoard
]

{ #category : #'as yet unclassified' }
BoardStore >> get: aName [
	| b |
	b := boards at: aName ifAbsent: nil.
	b isNil ifTrue: [ b := Board new label: aName. self at: aName put: b.].
	^ b
]

{ #category : #'as yet unclassified' }
BoardStore >> initialize [ 
	boards := Dictionary new.

]

{ #category : #'as yet unclassified' }
BoardStore >> list [
	^ boards keys
]
