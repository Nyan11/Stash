Class {
	#name : #StashAssociation,
	#superclass : #StashObject,
	#category : #'Stash-Serializer-stash-objects'
}

{ #category : #'as yet unclassified' }
StashAssociation >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep constructAssociation: self on: aStash
]

{ #category : #'as yet unclassified' }
StashAssociation >> nextInstances [

	^ { self object key . self object value }
]
