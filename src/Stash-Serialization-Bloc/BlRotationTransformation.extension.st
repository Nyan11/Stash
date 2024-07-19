Extension { #name : #BlRotationTransformation }

{ #category : #'*Stash-Serialization-Bloc' }
BlRotationTransformation >> allSetterAndGettersForMyStash [

	| allSetterAndGettersForMyStash |
	allSetterAndGettersForMyStash := OrderedCollection new.
	allSetterAndGettersForMyStash add: ([ :e | self angle ]) onlyGetOnStash.
	allSetterAndGettersForMyStash add: ([ :e | self axis ]) onlyGetOnStash.
	self axis = BlVector zAxis
		ifFalse: [
			allSetterAndGettersForMyStash add: ([ :transform |
				 'rotateBy: ' , transform angle asStashContructor , 'around:'
				 , transform axis asStashContructor ] -> self) onlySetOnStash ]
		ifTrue: [
			allSetterAndGettersForMyStash add:
				([ :transform | 'rotateBy: ' , transform angle asStashContructor ]
				 -> self) onlySetOnStash ].
	^ allSetterAndGettersForMyStash
]
