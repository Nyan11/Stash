Class {
	#name : 'StashTestSetterGetter1',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'Stash-Serialization-test-cases',
	#package : 'Stash-Serialization',
	#tag : 'test-cases'
}

{ #category : 'as yet unclassified' }
StashTestSetterGetter1 >> allSetterAndGettersForMyStash [

	^ { #name: -> #name }
]

{ #category : 'accessing' }
StashTestSetterGetter1 >> name [

	^ name
]

{ #category : 'accessing' }
StashTestSetterGetter1 >> name: anObject [

	name := anObject
]
