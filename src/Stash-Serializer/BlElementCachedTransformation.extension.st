Extension { #name : #BlElementCachedTransformation }

{ #category : #'*Stash-Serializer' }
BlElementCachedTransformation >> allSetterAndGettersForMyStash [

	^ self asElementTransformation allSetterAndGettersForMyStash
]

{ #category : #'*Stash-Serializer' }
BlElementCachedTransformation >> asStashObject [

	^ StashBlTransformation new
		  object: self;
		  yourself
]
