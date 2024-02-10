Extension { #name : #BlRadialGradientPaint }

{ #category : #'*Stash-Serializer' }
BlRadialGradientPaint >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , {
		  (#innerCenter).
		  (#innerRadius).
		  (#outerCenter).
		  (#outerRadius) }
]
