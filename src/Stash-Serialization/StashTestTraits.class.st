Class {
	#name : #StashTestTraits,
	#superclass : #Object,
	#traits : 'TStashTest',
	#classTraits : 'TStashTest classTrait',
	#instVars : [
		'model4'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #initialization }
StashTestTraits >> initialize [

	model4 := StashTestTraitsModel new.
]

{ #category : #'as yet unclassified' }
StashTestTraits >> model4 [

	^ model4
]
