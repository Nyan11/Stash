Class {
	#name : #Stash,
	#superclass : #Object,
	#instVars : [
		'rootObject',
		'steps',
		'identityDictionary',
		'taggedObject',
		'stream',
		'uuid'
	],
	#category : #'Stash-Serializer-stash'
}

{ #category : #adding }
Stash >> addOnSourceCode: aString [

	stream << aString
]

{ #category : #adding }
Stash >> addTaggedObject: aStashObject [

	self taggedObject add: aStashObject.
	aStashObject tag: (self newTagFor: aStashObject)
]

{ #category : #accessing }
Stash >> identityDictionary [

	^ identityDictionary
]

{ #category : #private }
Stash >> initialize [

	uuid := 0.
	stream := String new writeStream.
	identityDictionary := IdentityDictionary new.
	taggedObject := OrderedCollection new.
	steps := {
		         StashPrepareObjectStep new.
		         StashTagObjectStep new.
		         StashTagVariablesStep new.
		         StashConstructTagObjectsStep new.
		         StashContructGeneralObjectsStep new }
]

{ #category : #'instance creation' }
Stash >> newTagFor: aStashObject [

	^ aStashObject object class printString asLowercase
	  , self nextUUID printString
]

{ #category : #'as yet unclassified' }
Stash >> nextUUID [

	^ uuid := uuid + 1
]

{ #category : #accessing }
Stash >> rootObject [

	^ rootObject
]

{ #category : #accessing }
Stash >> rootObject: anObject [

	rootObject := anObject
]

{ #category : #private }
Stash >> run [

	self steps do: [ :step | step runOn: self ].

	
]

{ #category : #private }
Stash >> serialize: anObject [

	self rootObject: anObject.
	self run.
	^ self sourceCode
]

{ #category : #adding }
Stash >> sourceCode [

	
	| expr |
	expr := RBParser parseExpression: stream contents expandMacros..
	^ RBSimpleFormatter format: expr
]

{ #category : #private }
Stash >> steps [

	^ steps
]

{ #category : #accessing }
Stash >> taggedObject [

	^ taggedObject
]
