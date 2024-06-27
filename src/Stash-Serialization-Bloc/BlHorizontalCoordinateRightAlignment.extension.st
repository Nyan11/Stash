Extension { #name : #BlHorizontalCoordinateRightAlignment }

{ #category : #'*Stash-Serialization-Bloc' }
BlHorizontalCoordinateRightAlignment >> asStashSelector [

	^ 'alignRightAt: '
	  , self coordinate printString
]
