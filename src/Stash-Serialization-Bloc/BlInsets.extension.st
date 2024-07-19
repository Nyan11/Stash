Extension { #name : #BlInsets }

{ #category : #'*Stash-Serialization-Bloc' }
BlInsets >> asStashContructor [

	self isUniform ifTrue: [
		self left = 0
			ifTrue: [ ^ 'BlInsets empty' ]
			ifFalse: [ ^ 'BlInsets all: ' , self left printString ] ].
	^ 'BlInsets top: <1p> right: <2p> bottom: <3p> left: <4p>'
		  expandMacrosWith: self top
		  with: self right
		  with: self bottom
		  with: self left
]
