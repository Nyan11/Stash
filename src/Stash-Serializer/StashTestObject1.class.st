Class {
	#name : #StashTestObject1,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #'as yet unclassified' }
StashTestObject1 >> allSetterAndGettersForMyStash [

	self name ifNil: [ ^ {  } ].
	^ { (#name: -> #name) }
]

{ #category : #accessing }
StashTestObject1 >> name [

	^ name
]

{ #category : #accessing }
StashTestObject1 >> name: anObject [

	name := anObject
]
