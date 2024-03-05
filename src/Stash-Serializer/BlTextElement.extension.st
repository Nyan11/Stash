Extension { #name : #BlTextElement }

{ #category : #'*Stash-Serializer' }
BlTextElement >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , { #text }
]
