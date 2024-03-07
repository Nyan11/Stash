Class {
	#name : #StashTesSetterGetter2,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #'as yet unclassified' }
StashTesSetterGetter2 >> allSetterAndGettersForMyStash [

	^ { #name }
]

{ #category : #accessing }
StashTesSetterGetter2 >> name [

	^ name
]

{ #category : #accessing }
StashTesSetterGetter2 >> name: anObject [

	name := anObject
]
