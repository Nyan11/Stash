Extension { #name : #BlPaintBackground }

{ #category : #'*Stash-Serializer' }
BlPaintBackground >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , { (#paint) }
]
