Extension { #name : #BlAffineTransformationLeftCenterOrigin }

{ #category : #'*Stash-Serialization-Bloc' }
BlAffineTransformationLeftCenterOrigin >> asStashMethodForTransformationBloc [

	^ 'origin: <1s> new' expandMacrosWith: self class printString.
]
