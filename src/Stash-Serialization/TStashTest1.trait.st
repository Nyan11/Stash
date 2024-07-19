Trait {
	#name : #TStashTest1,
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #'as yet unclassified' }
TStashTest1 >> allSetterAndGettersOfTraitForMyStash: anObject [

	^ { #test1 }
]

{ #category : #tests }
TStashTest1 >> model1 [

	^ self shouldBeImplemented
]

{ #category : #tests }
TStashTest1 >> test1 [

	^ self model1 test
]

{ #category : #tests }
TStashTest1 >> test1: anObject [

	self model1 test: anObject
]
