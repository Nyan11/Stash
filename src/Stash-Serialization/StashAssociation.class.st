Class {
	#name : 'StashAssociation',
	#superclass : 'StashAbstractObject',
	#category : 'Stash-Serialization-stash-objects',
	#package : 'Stash-Serialization',
	#tag : 'stash-objects'
}

{ #category : 'as yet unclassified' }
StashAssociation >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep constructAssociation: self on: aStash
]

{ #category : 'as yet unclassified' }
StashAssociation >> nextInstances [

	^ { self object key . self object value }
]
