Extension { #name : #BlElement }

{ #category : #'*Stash-Serialization-Toplo' }
BlElement >> allSetterAndGettersForMyStashAllStamps [

	<stashAccessors>
	self allStamps isEmpty ifTrue: [ ^ {  } ].
	^ self toStyleStore stampIndex allProperties collect: [ :assoc | | setter getter |
		setter := [ :element | 'addStamp: <1p> withValue:' expandMacrosWith: assoc value name ].
		getter := [ :element | assoc value value ].
		setter -> getter
		 ]

	
]

{ #category : #'*Stash-Serialization-Toplo' }
BlElement >> allSetterAndGettersForMyStashAllTokens [

	<stashAccessors>
	self ensuredToStyleStore.
	self toStyleStore tokenPropertyIndex isEmpty ifTrue: [ ^ {  } ].
	^ self toStyleStore tokenPropertyIndex allProperties collect: [ :assoc | | setter getter |
		setter := [ :element | 'addTokenNamed: <1p> withValue:' expandMacrosWith: assoc value name ].
		getter := [ :element | assoc value value ].
		setter -> getter
		 ]

	
]
