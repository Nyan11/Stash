Extension { #name : #BlPaintBackground }

{ #category : #'*Stash-Serialization-Bloc' }
BlPaintBackground >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , { (#paint) }
]
