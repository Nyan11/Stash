Extension { #name : #BlVector2D }

{ #category : #'*Stash-Serialization-Bloc' }
BlVector2D >> asStashContructor [

	self = BlVector xAxis ifTrue: [ ^ 'BlVector xAxis' ].
	self = BlVector yAxis ifTrue: [ ^ 'BlVector yAxis' ].
	self = BlVector zAxis ifTrue: [ ^ 'BlVector zAxis' ].
	^ 'BlVector x: <1p> y: <2p>' expandMacrosWith: self x with: self y
]
