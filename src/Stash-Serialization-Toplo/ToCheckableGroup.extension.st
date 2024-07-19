Extension { #name : #ToCheckableGroup }

{ #category : #'*Stash-Serialization-Toplo' }
ToCheckableGroup >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash, { #registerAll: -> #registeredCheckables }
]
