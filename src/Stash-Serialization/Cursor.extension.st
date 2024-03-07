Extension { #name : #Cursor }

{ #category : #'*Stash-Serialization' }
Cursor >> asStashContructor [

	| selectedCursors |
	self flag: #danger. "Working but uses class pool to access the correct values."
	selectedCursors := Cursor classPool associations select: [ :each |
		                   each value == self ].
	selectedCursors ifEmpty: [ ^ nil ].
	^ 'Cursor classPool at:' , selectedCursors first key printString
]
