Extension { #name : #BlAffineTransformationNormalizedPositionOrigin }

{ #category : #'*Stash-Serialization-Bloc' }
BlAffineTransformationNormalizedPositionOrigin >> asStashMethodForTransformationBloc [

	^ 'normalizedOrigin: <1p> @ <2p>' expandMacrosWith: self position x with: self position y
]
