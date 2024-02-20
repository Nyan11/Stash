Extension { #name : #BlElementCachedTransformation }

{ #category : #'*Stash-Serializer' }
BlElementCachedTransformation >> asStashObject [

	^ StashBlTransformation new
		  object: self;
		  yourself
]
