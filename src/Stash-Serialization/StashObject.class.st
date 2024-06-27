Class {
	#name : 'StashObject',
	#superclass : 'StashAbstractObject',
	#instVars : [
		'properties'
	],
	#category : 'Stash-Serialization-stash-objects',
	#package : 'Stash-Serialization',
	#tag : 'stash-objects'
}

{ #category : 'as yet unclassified' }
StashObject >> allGetters [

	^ self allSettersAndGettersAsProperty
		  select: [ :each | each isStashGetter ]
]

{ #category : 'as yet unclassified' }
StashObject >> allSetters [

	^ self allSettersAndGettersAsProperty select: [ :each |
		  each isStashSetter ]
]

{ #category : 'as yet unclassified' }
StashObject >> allSettersAndGettersAsProperty [

	"Accelertor with properties slot."
	^ properties ifNil: [
		  properties := self object allSetterAndGettersForMyStash collect: [
			                :each | each asStashProperty ] ]
]

{ #category : 'stash - step' }
StashObject >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep constructObject: self on: aStash
]

{ #category : 'as yet unclassified' }
StashObject >> getInstanceWith: aStashGetter [

	aStashGetter getter isBlock ifTrue: [ ^ aStashGetter getter value: self object ].
	^ self object perform: aStashGetter getter
]

{ #category : 'as yet unclassified' }
StashObject >> nextInstances [

	^ self allGetters collect: [ :each |
		  self getInstanceWith: each ]
]

{ #category : 'accessing' }
StashObject >> object: anObject [

	object := anObject.
	self allSetters ifEmpty: [
		self propertiesAreSet ].
]
