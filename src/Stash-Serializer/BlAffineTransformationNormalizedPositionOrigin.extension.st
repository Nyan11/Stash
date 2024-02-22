Extension { #name : #BlAffineTransformationNormalizedPositionOrigin }

{ #category : #'*Stash-Serializer' }
BlAffineTransformationNormalizedPositionOrigin >> = anObject [

	super = anObject ifFalse: [ ^ false ].
	^ self position = anObject position
]

{ #category : #'*Stash-Serializer' }
BlAffineTransformationNormalizedPositionOrigin >> asStashMethodForTransformationBloc [

	^ 'normalizedOrigin: <1p> @ <2p>' expandMacrosWith: self position x with: self position y
]
