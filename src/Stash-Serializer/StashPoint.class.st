Class {
	#name : #StashPoint,
	#superclass : #StashObject,
	#category : #'Stash-Serializer-stash'
}

{ #category : #testing }
StashPoint >> isStashPoint [

	^ true
]

{ #category : #'as yet unclassified' }
StashPoint >> nextInstances [

	^ { self object x . self object y }
]
