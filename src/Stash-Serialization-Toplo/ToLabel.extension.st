Extension { #name : 'ToLabel' }

{ #category : '*Stash-Serialization-Toplo' }
ToLabel >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , { #text }
]
