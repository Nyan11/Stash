Extension { #name : 'BlHorizontalCoordinateLeftAlignment' }

{ #category : '*Stash-Serialization-Bloc' }
BlHorizontalCoordinateLeftAlignment >> asStashSelector [

	^ 'alignLeftAt: ' , self coordinate printString
]
