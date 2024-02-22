Extension { #name : #BlReflectionTransformation }

{ #category : #'*Stash-Serializer' }
BlReflectionTransformation >> allSetterAndGettersForMyStash [

	self reflection = (BlVector x: -1 y: 1) ifTrue: [
		^ { (#flipY -> self) onlySetOnStash } ].
	self reflection = (BlVector x: 1 y: -1) ifTrue: [
		^ { (#flipX -> self) onlySetOnStash } ]
]
