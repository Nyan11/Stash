Extension { #name : #BlScalingTransformation }

{ #category : #'*Stash-Serialization-Bloc' }
BlScalingTransformation >> allSetterAndGettersForMyStash [

	self scale x = self scale y ifTrue: [
		^ { ([ :transform |
		  'scaleBy: <1s>' expandMacrosWith: transform scale x asStashContructor ] -> self)
			  onlySetOnStash } ].
	^ { ([ :transform |
	  'scaleBy: <1s> @ <2s>'
		  expandMacrosWith: transform scale x asStashContructor
		  with: transform scale y asStashContructor ] -> self) onlySetOnStash }
]
