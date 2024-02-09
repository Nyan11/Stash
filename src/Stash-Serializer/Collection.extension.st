Extension { #name : #Collection }

{ #category : #'*Stash-Serializer' }
Collection >> allGettersForMyStash [

	^ {  }
]

{ #category : #'*Stash-Serializer' }
Collection >> asStashObject [

	^ StashCollection new
		  object: self;
		  classType: self class;
		  yourself
]
