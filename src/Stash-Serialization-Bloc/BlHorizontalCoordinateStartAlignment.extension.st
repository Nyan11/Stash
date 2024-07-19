Extension { #name : #BlHorizontalCoordinateStartAlignment }

{ #category : #'*Stash-Serialization-Bloc' }
BlHorizontalCoordinateStartAlignment >> asStashSelector [

	^ 'alignCenterAt: '
	  , self coordinate printString
]
