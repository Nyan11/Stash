Extension { #name : #BlRadialGradientPaint }

{ #category : #'*Stash-Serializer' }
BlRadialGradientPaint >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , {
		  (#innerCenter: -> #innerCenter).
		  (#innerRadius: -> #innerRadius).
		(#outerCenter: -> #outerCenter).
		  (#outerRadius: -> #outerRadius) }
]
