Class {
	#name : #StashTestSetterGetter4,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #accessing }
StashTestSetterGetter4 >> name [

	^ name
]

{ #category : #accessing }
StashTestSetterGetter4 >> name: anObject [

	name := anObject
]

{ #category : #'as yet unclassified' }
StashTestSetterGetter4 >> stashAccessor [

	<stashAccessors>
	^ { #name }
]
