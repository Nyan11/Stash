Extension { #name : #BlLayoutConstraints }

{ #category : #'*Stash-Serializer' }
BlLayoutConstraints >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self horizontal allSetterAndGettersForMyStash ifNotEmpty: [ settersAndGetters add: #horizontal onlyGetOnStash ].
	self vertical allSetterAndGettersForMyStash ifNotEmpty: [ settersAndGetters add: #vertical onlyGetOnStash ].
	^ settersAndGetters
]

{ #category : #'*Stash-Serializer' }
BlLayoutConstraints >> asStashObject [

	^ StashBlLayoutConstraints new
		  object: self;
		  yourself
]
