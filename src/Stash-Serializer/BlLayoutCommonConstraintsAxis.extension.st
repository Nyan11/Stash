Extension { #name : #BlLayoutCommonConstraintsAxis }

{ #category : #'*Stash-Serializer' }
BlLayoutCommonConstraintsAxis >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self resizer isMatchParent ifTrue: [
		settersAndGetters add: #matchParent onlySetOnStash ].
	self resizer isFitContent ifTrue: [
		settersAndGetters add: #fitContent onlySetOnStash ].
	self resizer isExact ifTrue: [
		settersAndGetters add: (#exact: -> [ :axis | axis resizer size ]) onlySetOnStash ].
	^ settersAndGetters
]
