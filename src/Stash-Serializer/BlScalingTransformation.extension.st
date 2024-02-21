Extension { #name : #BlScalingTransformation }

{ #category : #'*Stash-Serializer' }
BlScalingTransformation >> allSetterAndGettersForMyStash [

	self scale x = self scale y ifTrue: [ ^ { [ :e |
	  'scaleBy: <1s>' expandMacrosWith: self scale x asStashContructor ]
		  onlySetOnStash } ].
	^ { [ :e |
	  'scaleBy: <1s> @ <2s>' expandMacrosWith: self scale x asStashContructor with: self scale y asStashContructor ]
		  onlySetOnStash }
	
]
