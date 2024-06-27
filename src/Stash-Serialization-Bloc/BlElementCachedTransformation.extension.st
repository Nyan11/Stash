Extension { #name : 'BlElementCachedTransformation' }

{ #category : '*Stash-Serialization-Bloc' }
BlElementCachedTransformation >> allSetterAndGettersForMyStash [

	^ self asElementTransformation allSetterAndGettersForMyStash
]

{ #category : '*Stash-Serialization-Bloc' }
BlElementCachedTransformation >> asStashObject [

	^ StashBlTransformation new
		  object: self;
		  yourself
]
