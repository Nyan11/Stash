Class {
	#name : #StashTesSetterGetter1,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #'as yet unclassified' }
StashTesSetterGetter1 >> allSetterAndGettersForMyStash [

	^ { #name: -> #name }
]

{ #category : #accessing }
StashTesSetterGetter1 >> name [

	^ name
]

{ #category : #accessing }
StashTesSetterGetter1 >> name: anObject [

	name := anObject
]
