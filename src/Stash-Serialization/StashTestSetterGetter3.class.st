Class {
	#name : #StashTestSetterGetter3,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #'as yet unclassified' }
StashTestSetterGetter3 >> allSetterAndGettersForMyStash [

	^ { (#name: -> [ :obj | obj name ]) }
]

{ #category : #accessing }
StashTestSetterGetter3 >> name [

	^ name
]

{ #category : #accessing }
StashTestSetterGetter3 >> name: anObject [

	name := anObject
]
