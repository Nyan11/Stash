Extension { #name : #BlAffineTransformationPositionOrigin }

{ #category : #'*Stash-Serializer' }
BlAffineTransformationPositionOrigin >> = anObject [

	super = anObject ifFalse: [ ^ false ].
	^ self position = anObject position
]

{ #category : #'*Stash-Serializer' }
BlAffineTransformationPositionOrigin >> asStashMethodForTransformationBloc [

	^ 'origin: (<1s> new position: <2s> @ <3s>; yourself)' expandMacrosWith: self class printString with: self position x with: self position y
]
