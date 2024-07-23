Class {
	#name : #StashObjectWithBuilder,
	#superclass : #StashObject,
	#instVars : [
		'builder',
		'methodToBuild'
	],
	#category : #'Stash-Serialization-stash-objects'
}

{ #category : #accessing }
StashObjectWithBuilder >> builder [

	^ builder
]

{ #category : #accessing }
StashObjectWithBuilder >> builder: anObject [

	builder := anObject
]

{ #category : #'as yet unclassified' }
StashObjectWithBuilder >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep constructObjectWithBuilder: self on: aStash
]

{ #category : #accessing }
StashObjectWithBuilder >> constructor [

	^ self builder asStashConstructor
]

{ #category : #'as yet unclassified' }
StashObjectWithBuilder >> constructorOrTag [

	self shouldBeTagged ifFalse: [ ^ self builder asStashConstructor ].
	^ self tag
]

{ #category : #accessing }
StashObjectWithBuilder >> methodToBuild [

	^ methodToBuild
]

{ #category : #accessing }
StashObjectWithBuilder >> methodToBuild: anObject [

	methodToBuild := anObject
]
