Class {
	#name : #StashError,
	#superclass : #Error,
	#instVars : [
		'context'
	],
	#category : #'Stash-Serialization-stash'
}

{ #category : #accessing }
StashError >> context [

	^ context
]

{ #category : #accessing }
StashError >> context: anObject [

	context := anObject
]
