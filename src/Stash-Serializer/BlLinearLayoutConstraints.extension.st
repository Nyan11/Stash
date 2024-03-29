Extension { #name : #BlLinearLayoutConstraints }

{ #category : #'*Stash-Serializer' }
BlLinearLayoutConstraints >> allSetterAndGettersForMyStash [

	| collection |
	collection := super allSetterAndGettersForMyStash asOrderedCollection.
	weight = 1 ifFalse: [ collection add: #weight ].
	^ collection
]
