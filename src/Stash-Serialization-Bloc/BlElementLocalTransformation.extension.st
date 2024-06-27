Extension { #name : 'BlElementLocalTransformation' }

{ #category : '*Stash-Serialization-Bloc' }
BlElementLocalTransformation >> allSetterAndGettersForMyStash [

	^ self affineTransformation allSetterAndGettersForMyStash
]
