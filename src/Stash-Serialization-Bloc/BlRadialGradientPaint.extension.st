Extension { #name : #BlRadialGradientPaint }

{ #category : #'*Stash-Serialization-Bloc' }
BlRadialGradientPaint >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , {
		  (#innerCenter).
		  (#innerRadius).
		  (#outerCenter).
		  (#outerRadius) }
]
