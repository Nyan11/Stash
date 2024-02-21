Extension { #name : #BlReflectionTransformation }

{ #category : #'*Stash-Serializer' }
BlReflectionTransformation >> allSetterAndGettersForMyStash [

	self reflection = (BlVector x: -1 y: 1) ifTrue: [
		^ { #flipY onlySetOnStash } ].
	self reflection = (BlVector x: 1 y: -1) ifTrue: [
		^ { #flipX onlySetOnStash } ]
]
