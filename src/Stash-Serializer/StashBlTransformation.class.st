Class {
	#name : #StashBlTransformation,
	#superclass : #StashObject,
	#category : #'Stash-Serializer-stash-objects'
}

{ #category : #'stash - step' }
StashBlTransformation >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep
		constructBlTransformation: self
		on: aStash
]
