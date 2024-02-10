Extension { #name : #BlSimpleShadowEffect }

{ #category : #'*Stash-Serializer' }
BlSimpleShadowEffect >> asStashContructor [

	self flag: #ToFix. "Not correct"
	^ 'BlSimpleShadowEffect color: (' , self color asStashContructor
	  , ') offset: ((' , self offset x printString , ')@('
	  , self offset y printString , '))'
]
