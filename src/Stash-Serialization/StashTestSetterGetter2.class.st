Class {
	#name : #StashTestSetterGetter2,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #accessing }
StashTestSetterGetter2 >> name [

	^ name
]

{ #category : #accessing }
StashTestSetterGetter2 >> name: anObject [

	name := anObject
]

{ #category : #'as yet unclassified' }
StashTestSetterGetter2 >> stashAccessors [

	<stashAccessors>

	^ { #name }
]
