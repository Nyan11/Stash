Extension { #name : #String }

{ #category : #'*Stash-Serialization' }
String >> asStashObject [

	^ StashObject new
		  object: self;
		  yourself
]
