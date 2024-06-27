Class {
	#name : 'StashTestTraits',
	#superclass : 'Object',
	#traits : 'TStashTest1 + TStashTest2 + TStashTest3',
	#classTraits : 'TStashTest1 classTrait + TStashTest2 classTrait + TStashTest3 classTrait',
	#instVars : [
		'model1',
		'model2'
	],
	#category : 'Stash-Serialization-test-cases',
	#package : 'Stash-Serialization',
	#tag : 'test-cases'
}

{ #category : 'initialization' }
StashTestTraits >> initialize [

	model1 := StashTestTraitsModel new.
	model2 := StashTestTraitsModel new.
]

{ #category : 'tests' }
StashTestTraits >> model1 [

	^ model1
]

{ #category : 'as yet unclassified' }
StashTestTraits >> model2 [

	^ model2
]
