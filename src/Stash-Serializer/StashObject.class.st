Class {
	#name : #StashObject,
	#superclass : #Object,
	#instVars : [
		'tag',
		'object',
		'occurences',
		'propertiesSet'
	],
	#category : #'Stash-Serializer-stash-objects'
}

{ #category : #adding }
StashObject >> addTagOrConstructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	(self shouldBeTagged and: [ self isPropertiesSet ])
		ifTrue: [
			aStashContructGeneralObjectsStep addTag: self tag on: aStash.
			^ self ].
	self constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash
]

{ #category : #'as yet unclassified' }
StashObject >> allGettersForMyStash [

	^ self object allSetterAndGettersForMyStash select: [ :each | each isStashGetter ] thenCollect: #value
]

{ #category : #'as yet unclassified' }
StashObject >> allSetterAndGettersForMyStash [

	^ self object allSetterAndGettersForMyStash collect: [ :each | each isAssociation ifTrue: [ each ] ifFalse: [ each asMutator -> each ] ]
]

{ #category : #'as yet unclassified' }
StashObject >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep constructObject: self on: aStash
]

{ #category : #'as yet unclassified' }
StashObject >> constructorOrTag [

	self shouldBeTagged ifFalse: [ ^ self object asStashContructor ].
	^ self tag
]

{ #category : #'as yet unclassified' }
StashObject >> getInstanceWith: anObject [
		 anObject isBlock
			  ifTrue: [ ^ anObject value: self object ]
			  ifFalse: [ ^ self object perform: anObject ]
]

{ #category : #'as yet unclassified' }
StashObject >> increaseOccurences [

	occurences := occurences + 1
]

{ #category : #'as yet unclassified' }
StashObject >> initialize [

	occurences := 1.
	propertiesSet := false
]

{ #category : #testing }
StashObject >> isPropertiesSet [

	^ propertiesSet.
]

{ #category : #'as yet unclassified' }
StashObject >> nextInstances [

	^ self allGettersForMyStash
		  collect: [ :each | self getInstanceWith: each ]
]

{ #category : #'as yet unclassified' }
StashObject >> nextSettersAndInstances [

	^ self allSetterAndGettersForMyStash collect: [ :each |
		each isStashGetter ifTrue: [ each key -> (self getInstanceWith: each value) ] ifFalse: [ each ].
		   ]
]

{ #category : #accessing }
StashObject >> object [

	^ object
]

{ #category : #accessing }
StashObject >> object: anObject [

	object := anObject.
	anObject allSetterAndGettersForMyStash ifEmpty: [ self propertiesAreSet ]
]

{ #category : #asserting }
StashObject >> occurences [

	^ occurences
]

{ #category : #'as yet unclassified' }
StashObject >> propertiesAreSet [

	propertiesSet := true
]

{ #category : #asserting }
StashObject >> shouldBeTagged [

	self object shouldBeTagged ifFalse: [ ^ false ].
	^ self occurences > 1
]

{ #category : #accessing }
StashObject >> tag [

	^ tag
]

{ #category : #accessing }
StashObject >> tag: anObject [

	tag := anObject
]
