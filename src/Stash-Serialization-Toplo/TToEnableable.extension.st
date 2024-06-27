Extension { #name : 'TToEnableable' }

{ #category : '*Stash-Serialization-Toplo' }
TToEnableable >> allSetterAndGettersOfTraitForMyStash: aToElement [

	aToElement isEnabled ifTrue: [ ^ {  } ].
	^ { #enabled: -> #isEnabled }
]
