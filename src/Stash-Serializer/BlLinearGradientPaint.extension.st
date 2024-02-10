Extension { #name : #BlLinearGradientPaint }

{ #category : #'*Stash-Serializer' }
BlLinearGradientPaint >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , {
		  (#start).
		  (#end) }
]
