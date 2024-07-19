Extension { #name : #BlVerticalCoordinateTopAlignment }

{ #category : #'*Stash-Serialization-Bloc' }
BlVerticalCoordinateTopAlignment >> asStashSelector [


	^ self relativeAlignment asStashSelector, 'At: ' , self coordinate printString
]
