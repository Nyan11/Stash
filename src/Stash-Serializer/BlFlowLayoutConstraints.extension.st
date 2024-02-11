Extension { #name : #BlFlowLayoutConstraints }

{ #category : #'*Stash-Serializer' }
BlFlowLayoutConstraints >> allSetterAndGettersForMyStash [

	| collection |
	collection := super allSetterAndGettersForMyStash asOrderedCollection.
	newLine ifTrue: [ collection add: #newLine: -> #isNewLine ].
	weight == 0 ifFalse: [ collection add: #weight ].
	^ collection
]
