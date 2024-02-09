Extension { #name : #Point }

{ #category : #'*Stash-Serializer' }
Point >> asStashObject [

	^ StashPoint new
		  object: self;
		  yourself
]
