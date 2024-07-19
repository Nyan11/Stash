Extension { #name : #BlElement }

{ #category : #'*Stash-Serialization-Toplo' }
BlElement >> allSetterAndGettersForMyStashStamp: settersAndGetters [

	self allStamps isEmpty ifTrue: [ ^ settersAndGetters ].
	self allStamps do: [ :each | settersAndGetters add: #addStamp: -> [ :e | each ] ].

	^ settersAndGetters
]

{ #category : #'*Stash-Serialization-Toplo' }
BlElement >> allToploSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self allSetterAndGettersForMyStashStamp: settersAndGetters.

	^ settersAndGetters
]
