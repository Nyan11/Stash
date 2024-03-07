Class {
	#name : #StashTesSetterGetter3,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #'as yet unclassified' }
StashTesSetterGetter3 >> allSetterAndGettersForMyStash [

	^ { (#name: -> [ :obj | obj name ]) }
]

{ #category : #accessing }
StashTesSetterGetter3 >> name [

	^ name
]

{ #category : #accessing }
StashTesSetterGetter3 >> name: anObject [

	name := anObject
]
