Extension { #name : 'BlMatrix2D' }

{ #category : '*Stash-Serialization-Bloc' }
BlMatrix2D >> asStashContructor [

	self isIdentity ifTrue: [ ^ 'BlMatrix2D new' ].
	^ 'BlMatrix2D new x: <1p>; y: <2p>; shx: <3p>; shy: <4p>; sx: <5p>; sy: <6p>; yourself'
		  expandMacrosWithArguments: {
				  self x.
				  self y.
				  self shx.
				  self shy.
				  self sx.
				  self sy }
]
