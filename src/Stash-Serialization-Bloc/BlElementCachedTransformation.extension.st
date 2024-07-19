Extension { #name : #BlElementCachedTransformation }

{ #category : #'*Stash-Serialization-Bloc' }
BlElementCachedTransformation >> asStashObject [

	^ StashBlTransformation new
		  object: self;
		  yourself
]

{ #category : #'*Stash-Serialization-Bloc' }
BlElementCachedTransformation >> stashAccessors [

	<stashAccessors>
	^ self asElementTransformation allSetterAndGettersForMyStash
]
