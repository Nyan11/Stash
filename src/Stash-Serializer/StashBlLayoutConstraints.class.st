Class {
	#name : #StashBlLayoutConstraints,
	#superclass : #StashObject,
	#category : #'Stash-Serializer-stash-objects'
}

{ #category : #'as yet unclassified' }
StashBlLayoutConstraints >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep
		constructBlLayoutConstraints: self
		on: aStash
]

{ #category : #asserting }
StashBlLayoutConstraints >> shouldBeTagged [

	^ false
]
