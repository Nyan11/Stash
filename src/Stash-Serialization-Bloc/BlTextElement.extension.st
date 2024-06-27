Extension { #name : 'BlTextElement' }

{ #category : '*Stash-Serialization-Bloc' }
BlTextElement >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , { #text }
]
