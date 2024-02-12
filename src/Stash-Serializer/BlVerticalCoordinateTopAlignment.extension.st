Extension { #name : #BlVerticalCoordinateTopAlignment }

{ #category : #'*Stash-Serializer' }
BlVerticalCoordinateTopAlignment >> asStashSelector [

	^ 'alignBottomAt: ', (self coordinate printString)
]
