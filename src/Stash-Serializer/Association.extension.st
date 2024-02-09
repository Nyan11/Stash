Extension { #name : #Association }

{ #category : #'*Stash-Serializer' }
Association >> asStashObject [

	^ StashAssociation new
		  object: self;
		  yourself
]
