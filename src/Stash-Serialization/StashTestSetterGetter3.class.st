Class {
	#name : #StashTestSetterGetter3,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #accessing }
StashTestSetterGetter3 >> name [

	^ name
]

{ #category : #accessing }
StashTestSetterGetter3 >> name: anObject [

	name := anObject
]

{ #category : #'as yet unclassified' }
StashTestSetterGetter3 >> stashAccessors [

	<stashAccessors>

	^ { (#name: -> [ :obj | obj name ]) }
]
