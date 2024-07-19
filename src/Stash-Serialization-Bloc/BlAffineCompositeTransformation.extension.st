Extension { #name : #BlAffineCompositeTransformation }

{ #category : #'*Stash-Serialization-Bloc' }
BlAffineCompositeTransformation >> allSetterAndGettersForMyStash [ 

	^ self transformations flatCollect: [ :each | each allSetterAndGettersForMyStash ]
]
