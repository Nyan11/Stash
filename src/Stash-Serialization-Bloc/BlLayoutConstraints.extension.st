Extension { #name : #BlLayoutConstraints }

{ #category : #'*Stash-Serialization-Bloc' }
BlLayoutConstraints >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self horizontal allSetterAndGettersForMyStash ifNotEmpty: [ settersAndGetters add: #horizontal onlyGetOnStash ].
	self vertical allSetterAndGettersForMyStash ifNotEmpty: [ settersAndGetters add: #vertical onlyGetOnStash ].
	^ settersAndGetters
]

{ #category : #'*Stash-Serialization-Bloc' }
BlLayoutConstraints >> asStashObject [

	^ StashBlLayoutConstraints new
		  object: self;
		  yourself
]
