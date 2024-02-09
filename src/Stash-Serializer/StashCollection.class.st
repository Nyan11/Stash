Class {
	#name : #StashCollection,
	#superclass : #StashObject,
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

{ #category : #testing }
StashCollection >> isStashCollection [

	^ true
]

{ #category : #'as yet unclassified' }
StashCollection >> nextInstances [

	^ self object
]
