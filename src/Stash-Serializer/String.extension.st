Extension { #name : #String }

{ #category : #'*Stash-Serializer' }
String >> asStashObject [

	^ StashObject new
		  object: self;
		  yourself
]
