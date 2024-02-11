Extension { #name : #BlLayoutConstraints }

{ #category : #'*Stash-Serializer' }
BlLayoutConstraints >> asStashObject [

	^ StashBlLayoutConstraints new
		  object: self;
		  yourself
]
