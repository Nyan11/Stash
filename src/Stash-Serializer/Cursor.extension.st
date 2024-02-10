Extension { #name : #Cursor }

{ #category : #'*Stash-Serializer' }
Cursor >> asStashContructor [

	| selectedCursors |
	self flag: #danger. "Working but not correct."
	selectedCursors := Cursor classPool associations select: [ :each |
		                   each value == self ].
	selectedCursors ifEmpty: [ ^ nil ].
	^ 'Cursor classPool at:' , selectedCursors first key printString
]
