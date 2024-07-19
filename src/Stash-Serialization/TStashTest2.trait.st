Trait {
	#name : #TStashTest2,
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #'as yet unclassified' }
TStashTest2 >> allSetterAndGettersOfTraitForMyStash: anObject [

	^ { #test2 }
]

{ #category : #'as yet unclassified' }
TStashTest2 >> model2 [

	^ self shouldBeImplemented
]

{ #category : #tests }
TStashTest2 >> test2 [

	^ self model2 test
]

{ #category : #tests }
TStashTest2 >> test2: anObject [

	self model2 test: anObject
]
