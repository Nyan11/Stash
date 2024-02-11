Extension { #name : #Symbol }

{ #category : #'*Stash-Serializer' }
Symbol >> asStashProperty [

	^ (self asMutator -> self) asStashProperty
]

{ #category : #'*Stash-Serializer' }
Symbol >> isStashGetter [
^ true
]

{ #category : #'*Stash-Serializer' }
Symbol >> onlyGetOnStash [

	^ StashOnlyGetter new
		  context: self;
		  yourself
]

{ #category : #'*Stash-Serializer' }
Symbol >> onlySetOnStash [

	^ StashOnlySetter new
		  context: self;
		  yourself
]
