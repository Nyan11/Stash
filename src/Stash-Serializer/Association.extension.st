Extension { #name : #Association }

{ #category : #'*Stash-Serializer' }
Association >> asStashObject [

	^ StashAssociation new
		  object: self;
		  yourself
]

{ #category : #'*Stash-Serializer' }
Association >> isStashGetter [

	^ true
]

{ #category : #'*Stash-Serializer' }
Association >> isStashSetter [

	^ true
]

{ #category : #'*Stash-Serializer' }
Association >> onlySetOnStash [

	^ StashOnlySetter new context: self; yourself
]
