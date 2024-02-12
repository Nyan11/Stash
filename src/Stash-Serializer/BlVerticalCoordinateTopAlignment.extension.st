Extension { #name : #BlVerticalCoordinateTopAlignment }

{ #category : #'*Stash-Serializer' }
BlVerticalCoordinateTopAlignment >> asStashSelector [


	^ self relativeAlignment asStashSelector, 'At: ' , self coordinate printString
]
