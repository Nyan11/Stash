Extension { #name : #BlLayoutCommonConstraints }

{ #category : #'*Stash-Serializer' }
BlLayoutCommonConstraints >> asStashObject [

	^ StashBlLayoutConstraints new
		  object: self;
		  yourself
]
