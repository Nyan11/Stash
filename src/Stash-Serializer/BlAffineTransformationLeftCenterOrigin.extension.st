Extension { #name : #BlAffineTransformationLeftCenterOrigin }

{ #category : #'*Stash-Serializer' }
BlAffineTransformationLeftCenterOrigin >> asStashMethodForTransformationBloc [

	^ 'origin: <1s> new' expandMacrosWith: self class printString.
]
