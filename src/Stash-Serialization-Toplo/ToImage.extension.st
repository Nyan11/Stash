Extension { #name : #ToImage }

{ #category : #'*Stash-Serialization-Toplo' }
ToImage >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , { #innerImage }
]
