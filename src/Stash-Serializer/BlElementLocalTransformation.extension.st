Extension { #name : #BlElementLocalTransformation }

{ #category : #'*Stash-Serializer' }
BlElementLocalTransformation >> allSetterAndGettersForMyStash [

	^ self affineTransformation allSetterAndGettersForMyStash
]
