Extension { #name : #BlHorizontalCoordinateStartAlignment }

{ #category : #'*Stash-Serializer' }
BlHorizontalCoordinateStartAlignment >> asStashSelector [

	^ 'alignCenterAt: '
	  , self coordinate printString
]
