Extension { #name : #BlHorizontalCoordinateLeftAlignment }

{ #category : #'*Stash-Serializer' }
BlHorizontalCoordinateLeftAlignment >> asStashSelector [

	^ 'alignLeftAt: ' , self coordinate printString
]
