Extension { #name : #Color }

{ #category : #'*Stash-Serializer' }
Color >> asStashContructor [

	^ 'Color r: <1p> g: <2p> b: <3p> alpha: <4p>'
		  expandMacrosWith: self red
		  with: self green
		  with: self blue
		  with: self alpha 
]

{ #category : #'*Stash-Serializer' }
Color >> shouldBeTagged [

	^ false
]
