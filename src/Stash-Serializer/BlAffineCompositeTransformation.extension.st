Extension { #name : #BlAffineCompositeTransformation }

{ #category : #'*Stash-Serializer' }
BlAffineCompositeTransformation >> allSetterAndGettersForMyStash [ 

	^ self transformations flatCollect: [ :each | each allSetterAndGettersForMyStash ]
]
