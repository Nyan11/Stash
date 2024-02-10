Class {
	#name : #StashPoint,
	#superclass : #StashObject,
	#category : #'Stash-Serializer-stash-objects'
}

{ #category : #'as yet unclassified' }
StashPoint >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep
		constructPoint: self
		on: aStash
]

{ #category : #'as yet unclassified' }
StashPoint >> nextInstances [

	^ { self object x . self object y }
]
