Extension { #name : #BlFlowLayoutConstraintsVertical }

{ #category : #'*Stash-Serialization-Bloc' }
BlFlowLayoutConstraintsVertical >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self alignment = BlElementAlignment start vertical ifFalse: [
			settersAndGetters add:
			[ :n | self alignment asStashSelector ] onlySetOnStash ].

	^ settersAndGetters
]
