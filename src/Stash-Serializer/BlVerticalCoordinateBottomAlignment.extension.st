Extension { #name : #BlVerticalCoordinateBottomAlignment }

{ #category : #'*Stash-Serializer' }
BlVerticalCoordinateBottomAlignment >> asStashSelector [

	^ self relativeAlignment asStashSelector, 'At: ' , self coordinate printString
]
