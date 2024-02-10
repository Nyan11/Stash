Extension { #name : #BlGaussianShadowEffect }

{ #category : #'*Stash-Serializer' }
BlGaussianShadowEffect >> asStashContructor [

	self flag: #ToFix. "Not correct".
	^ 'BlGaussianShadowEffect color: (' , self color asStashContructor
	  , ') width: (' , self width printString , ') offset: (('
	  , self offset x printString , ')@(' , self offset y printString
	  , '))'
]
