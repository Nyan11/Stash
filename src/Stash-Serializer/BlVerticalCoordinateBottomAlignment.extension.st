Extension { #name : #BlVerticalCoordinateBottomAlignment }

{ #category : #'*Stash-Serializer' }
BlVerticalCoordinateBottomAlignment >> asStashSelector [

		^ 'alignBottomAt: ', (self coordinate printString)
]
