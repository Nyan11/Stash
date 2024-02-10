Class {
	#name : #StashObjectWithBuilder,
	#superclass : #StashObject,
	#instVars : [
		'builder',
		'methodToBuild'
	],
	#category : #'Stash-Serializer-stash-objects'
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
StashObjectWithBuilder >> constructorOrTag [

	self shouldBeTagged ifFalse: [ ^ self builder asStashContructor ].
	^ self tag
]

{ #category : #testing }
StashObjectWithBuilder >> isStashObjectWithBuilder [

	^ true
]

{ #category : #accessing }
StashObjectWithBuilder >> methodToBuild [

	^ methodToBuild
]

{ #category : #accessing }
StashObjectWithBuilder >> methodToBuild: anObject [

	methodToBuild := anObject
]
