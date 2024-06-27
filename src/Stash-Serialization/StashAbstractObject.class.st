Class {
	#name : 'StashAbstractObject',
	#superclass : 'Object',
	#instVars : [
		'tag',
		'object',
		'occurences',
		'propertiesSet'
	],
	#category : 'Stash-Serialization-stash-objects',
	#package : 'Stash-Serialization',
	#tag : 'stash-objects'
}

{ #category : 'stash - step' }
StashAbstractObject >> addTagOrConstructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	(self shouldBeTagged and: [ self isPropertiesSet ])
		ifTrue: [
			aStashContructGeneralObjectsStep addTag: self tag on: aStash.
			^ self ].
	self constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash
]

{ #category : 'stash - step' }
StashAbstractObject >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	self shouldBeImplemented
]

{ #category : 'as yet unclassified' }
StashAbstractObject >> constructorOrTag [

	self shouldBeTagged ifFalse: [ ^ self object asStashContructor ].
	^ self tag
]

{ #category : 'as yet unclassified' }
StashAbstractObject >> increaseOccurences [

	occurences := occurences + 1
]

{ #category : 'as yet unclassified' }
StashAbstractObject >> initialize [

	occurences := 1.
	propertiesSet := false
]

{ #category : 'accessing' }
StashAbstractObject >> isPropertiesSet [

	^ propertiesSet.
]

{ #category : 'as yet unclassified' }
StashAbstractObject >> nextInstances [

	^ self shouldBeImplemented
]

{ #category : 'accessing' }
StashAbstractObject >> object [

	^ object
]

{ #category : 'accessing' }
StashAbstractObject >> object: anObject [

	object := anObject.
	anObject allSetterAndGettersForMyStash ifEmpty: [ self propertiesAreSet ]
]

{ #category : 'accessing' }
StashAbstractObject >> occurences [

	^ occurences
]

{ #category : 'as yet unclassified' }
StashAbstractObject >> propertiesAreSet [

	propertiesSet := true
]

{ #category : 'asserting' }
StashAbstractObject >> shouldBeTagged [

	self object shouldBeTagged ifFalse: [ ^ false ].
	^ self occurences > 1
]

{ #category : 'accessing' }
StashAbstractObject >> tag [

	^ tag
]

{ #category : 'accessing' }
StashAbstractObject >> tag: anObject [

	tag := anObject
]
