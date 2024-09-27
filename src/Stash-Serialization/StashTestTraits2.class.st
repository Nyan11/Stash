Class {
	#name : #StashTestTraits2,
	#superclass : #Object,
	#traits : 'TStashTest4',
	#classTraits : 'TStashTest4 classTrait',
	#instVars : [
		'model4'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #initialization }
StashTestTraits2 >> initialize [

	model4 := StashTestTraitsModel new.
]

{ #category : #'as yet unclassified' }
StashTestTraits2 >> model4 [

	^ model4
]
