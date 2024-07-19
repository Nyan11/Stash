Extension { #name : #BlAffineTransformationPositionOrigin }

{ #category : #'*Stash-Serialization-Bloc' }
BlAffineTransformationPositionOrigin >> asStashMethodForTransformationBloc [

	^ 'origin: (<1s> new position: <2s> @ <3s>; yourself)' expandMacrosWith: self class printString with: self position x with: self position y
]
