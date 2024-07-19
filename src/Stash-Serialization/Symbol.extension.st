Extension { #name : #Symbol }

{ #category : #'*Stash-Serialization' }
Symbol >> asStashProperty [

	^ (self asMutator -> self) asStashProperty
]

{ #category : #'*Stash-Serialization' }
Symbol >> isStashGetter [
^ true
]
