Class {
	#name : #StashObject,
	#superclass : #StashAbstractObject,
	#instVars : [
		'tag',
		'object',
		'occurences',
		'propertiesSet'
	],
	#category : #'Stash-Serializer-stash-objects'
}

{ #category : #'as yet unclassified' }
StashObject >> allGettersForMyStash [

	^ self object allSetterAndGettersForMyStash collect: #value
]

{ #category : #'as yet unclassified' }
StashObject >> allSetterAndGettersForMyStash [

	^ self object allSetterAndGettersForMyStash
]

{ #category : #'as yet unclassified' }
StashObject >> constructorOrTag [

	self shouldBeTagged ifFalse: [ ^ self object asStashContructor ].
	^ self tag
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

{ #category : #testing }
StashObject >> isStashObject [

	^ self class == StashObject
]

{ #category : #'as yet unclassified' }
StashObject >> nextInstances [

	^ self allGettersForMyStash collect: [ :each | self object perform: each ]
]

{ #category : #'as yet unclassified' }
StashObject >> nextSettersAndInstances [

	^ self allSetterAndGettersForMyStash  collect: [ :each |
		  (each key) -> (self object perform: each value) ]
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
