Extension { #name : #Cursor }

{ #category : #'*Stash-Serialization' }
Cursor >> asStashConstructor [

	| selectedCursors |
	self flag: #danger. "Working but uses class pool to access the correct values."
	selectedCursors := Cursor classPool associations select: [ :each |
		                   each value == self ].
	selectedCursors ifEmpty: [ ^ self printString ].
	^ 'Cursor classPool at:' , selectedCursors first key printString
]
