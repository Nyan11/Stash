Extension { #name : 'BlElement' }

{ #category : '*Stash-Serialization-Toplo' }
BlElement >> allSetterAndGettersForMyStashStamp: settersAndGetters [

	self allStamps isEmpty ifTrue:[ ^ settersAndGetters ].
	
	settersAndGetters add: #addAllStamps: -> #allStamps.
	
	^ settersAndGetters
	
	
]

{ #category : '*Stash-Serialization-Toplo' }
BlElement >> allToploSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self allSetterAndGettersForMyStashStamp: settersAndGetters.

	^ settersAndGetters
]
