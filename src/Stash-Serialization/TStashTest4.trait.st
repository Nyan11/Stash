Trait {
	#name : #TStashTest4,
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #'as yet unclassified' }
TStashTest4 >> model4 [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
TStashTest4 >> stashAccessorsForTraitsWithPragmas [

	<stashAccessors>
	^ { #test4 }
]

{ #category : #tests }
TStashTest4 >> test4 [

	^ self model4 test
]

{ #category : #tests }
TStashTest4 >> test4: anObject [

	self model4 test: anObject
]
