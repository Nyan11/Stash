Extension { #name : #BlLayoutCommonConstraintsAxis }

{ #category : #'*Stash-Serializer' }
BlLayoutCommonConstraintsAxis >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self resizer isMatchParent ifTrue: [
		settersAndGetters add: #matchParent onlySetOnStash ].
	self resizer isFitContent ifTrue: [
		settersAndGetters add: #fitContent onlySetOnStash ].
	(self resizer isExact and: [ self resizer size ~= 50.0 ]) ifTrue: [
		settersAndGetters add: #exact: -> [ :c | self resizer size ] ].
	^ settersAndGetters
]

{ #category : #'*Stash-Serializer' }
BlLayoutCommonConstraintsAxis >> shouldBeTagged [

	^ false.
]
