Class {
	#name : #StashTestSetterGetter2,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #'as yet unclassified' }
StashTestSetterGetter2 >> allSetterAndGettersForMyStash [

	^ { #name }
]

{ #category : #accessing }
StashTestSetterGetter2 >> name [

	^ name
]

{ #category : #accessing }
StashTestSetterGetter2 >> name: anObject [

	name := anObject
]
