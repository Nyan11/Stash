Class {
	#name : #StashTestTraits1,
	#superclass : #Object,
	#traits : 'TStashTest1 + TStashTest2 + TStashTest3',
	#classTraits : 'TStashTest1 classTrait + TStashTest2 classTrait + TStashTest3 classTrait',
	#instVars : [
		'model1',
		'model2'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #initialization }
StashTestTraits1 >> initialize [

	model1 := StashTestTraitsModel new.
	model2 := StashTestTraitsModel new.
]

{ #category : #tests }
StashTestTraits1 >> model1 [

	^ model1
]

{ #category : #'as yet unclassified' }
StashTestTraits1 >> model2 [

	^ model2
]
