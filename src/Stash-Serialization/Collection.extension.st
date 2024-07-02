Extension { #name : 'Collection' }

{ #category : '*Stash-Serialization' }
Collection >> asStashObject [

	^ StashCollection new
		  object: self;
		  classType: self class;
		  yourself
]

{ #category : '*Stash-Serialization' }
Collection >> shouldBeTagged [

	^ false
]
