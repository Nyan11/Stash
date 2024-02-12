Extension { #name : #BlHorizontalCoordinateRightAlignment }

{ #category : #'*Stash-Serializer' }
BlHorizontalCoordinateRightAlignment >> asStashSelector [

	^ 'alignRightAt: '
	  , self coordinate printString
]
