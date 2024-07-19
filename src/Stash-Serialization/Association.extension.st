Extension { #name : #Association }

{ #category : #'*Stash-Serialization' }
Association >> asStashObject [

	^ StashAssociation new
		  object: self;
		  yourself
]

{ #category : #'*Stash-Serialization' }
Association >> isStashGetter [

	^ true
]

{ #category : #'*Stash-Serialization' }
Association >> isStashSetter [

	^ true
]
