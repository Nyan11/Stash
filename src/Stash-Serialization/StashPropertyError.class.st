Class {
	#name : 'StashPropertyError',
	#superclass : 'Error',
	#instVars : [
		'context'
	],
	#category : 'Stash-Serialization-stash',
	#package : 'Stash-Serialization',
	#tag : 'stash'
}

{ #category : 'accessing' }
StashPropertyError >> context [

	^ context
]

{ #category : 'accessing' }
StashPropertyError >> context: anObject [

	context := anObject
]
