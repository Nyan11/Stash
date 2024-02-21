Extension { #name : #BlRotationTransformation }

{ #category : #'*Stash-Serializer' }
BlRotationTransformation >> allSetterAndGettersForMyStash [

	| allSetterAndGettersForMyStash |
	allSetterAndGettersForMyStash := OrderedCollection new.
	allSetterAndGettersForMyStash add: [ :e | self angle ] onlyGetOnStash.
	allSetterAndGettersForMyStash add: [ :e | self axis ] onlyGetOnStash.
	self axis = BlVector zAxis
		ifFalse: [
			allSetterAndGettersForMyStash add: [ :e |
				('rotateBy: ' , self angle asStashContructor , 'around:'
				 , self axis asStashContructor)  ] onlySetOnStash ]
		ifTrue: [
			allSetterAndGettersForMyStash add: [ :e |
				('rotateBy: ' , self angle asStashContructor)  ] onlySetOnStash ].
	^ allSetterAndGettersForMyStash
]
