Extension { #name : #BlVerticalCoordinateBottomAlignment }

{ #category : #'*Stash-Serialization-Bloc' }
BlVerticalCoordinateBottomAlignment >> asStashSelector [

		^ 'alignBottomAt: ', (self coordinate printString)
]
