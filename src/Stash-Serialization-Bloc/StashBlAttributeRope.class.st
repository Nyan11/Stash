Class {
	#name : #StashBlAttributeRope,
	#superclass : #StashObject,
	#instVars : [
		'rope',
		'attributes'
	],
	#category : #'Stash-Serialization-Bloc-stash-objects'
}

{ #category : #accessing }
StashBlAttributeRope >> attributes [

	^ attributes
]

{ #category : #accessing }
StashBlAttributeRope >> attributes: anObject [

	attributes := anObject
]

{ #category : #'stash - step' }
StashBlAttributeRope >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep
		constructBlAttributeRope: self
		on: aStash
]

{ #category : #accessing }
StashBlAttributeRope >> rope [

	^ rope
]

{ #category : #accessing }
StashBlAttributeRope >> rope: anObject [

	rope := anObject
]
