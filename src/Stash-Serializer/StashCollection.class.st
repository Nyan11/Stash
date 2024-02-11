Class {
	#name : #StashCollection,
	#superclass : #StashAbstractObject,
	#instVars : [
		'classType'
	],
	#category : #'Stash-Serializer-stash-objects'
}

{ #category : #accessing }
StashCollection >> classType [

	^ classType
]

{ #category : #accessing }
StashCollection >> classType: anObject [

	classType := anObject
]

{ #category : #'as yet unclassified' }
StashCollection >> constructForGeneralObjectStep: aStashContructGeneralObjectsStep on: aStash [

	aStashContructGeneralObjectsStep
		constructCollection: self
		on: aStash
]

{ #category : #'as yet unclassified' }
StashCollection >> nextInstances [

	^ self object
]
