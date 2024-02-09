Class {
	#name : #StashAssociation,
	#superclass : #StashObject,
	#category : #'Stash-Serializer-stash'
}

{ #category : #testing }
StashAssociation >> isStashAssociation [

	^ true
]

{ #category : #'as yet unclassified' }
StashAssociation >> nextInstances [

	^ { self object key . self object value }
]
