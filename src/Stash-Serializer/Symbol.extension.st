Extension { #name : #Symbol }

{ #category : #'*Stash-Serializer' }
Symbol >> asStashProperty [

	^ (self asMutator -> self) asStashProperty
]

{ #category : #'*Stash-Serializer' }
Symbol >> isStashGetter [
^ true
]
