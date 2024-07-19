Extension { #name : #BlTextElement }

{ #category : #'*Stash-Serialization-Bloc' }
BlTextElement >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , { #text }
]

{ #category : #'*Stash-Serialization-Bloc' }
BlTextElement >> stashAccessors [

	<stashAccessors>
	^ { #text }
]
