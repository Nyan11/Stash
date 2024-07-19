Extension { #name : #TToCheckable }

{ #category : #'*Stash-Serialization-Toplo' }
TToCheckable >> allSetterAndGettersOfTraitForMyStash: aToElement [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	settersAndGetters add: #checked.
	settersAndGetters add: #group.
	^ settersAndGetters
]
