Class {
	#name : #StashAbstractObject,
	#superclass : #Object,
	#category : #'Stash-Serializer-stash-objects'
}

{ #category : #testing }
StashAbstractObject >> isStashAssociation [

	^ false
]

{ #category : #testing }
StashAbstractObject >> isStashCollection [

	^ false
]

{ #category : #testing }
StashAbstractObject >> isStashDictionary [

	^ false
]

{ #category : #testing }
StashAbstractObject >> isStashObject [

	^ false
]

{ #category : #testing }
StashAbstractObject >> isStashObjectWithBuilder [

	^ false
]

{ #category : #testing }
StashAbstractObject >> isStashPoint [

	^ false
]
