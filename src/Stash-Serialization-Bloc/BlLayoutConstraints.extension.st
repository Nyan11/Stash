Extension { #name : #BlLayoutConstraints }

{ #category : #'*Stash-Serialization-Bloc' }
BlLayoutConstraints >> asStashObject [

	^ StashBlLayoutConstraints new
		  object: self;
		  yourself
]

{ #category : #'*Stash-Serialization-Bloc' }
BlLayoutConstraints >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self horizontal allSetterAndGettersForMyStash ifNotEmpty: [ settersAndGetters add: #horizontal onlyGetOnStash ].
	self vertical allSetterAndGettersForMyStash ifNotEmpty: [ settersAndGetters add: #vertical onlyGetOnStash ].
	^ settersAndGetters
]
