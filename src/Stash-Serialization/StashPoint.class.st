Class {
	#name : #StashPoint,
	#superclass : #StashAbstractObject,
	#category : #'Stash-Serialization-stash-objects'
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
