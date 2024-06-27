Extension { #name : 'Object' }

{ #category : '*Stash-Serialization' }
Object class >> allGettersForMyStash [

	^ self allSetterAndGettersForMyStash collect: #value.
]

{ #category : '*Stash-Serialization' }
Object >> allSetterAndGettersForMyStash [

	^ self allSetterAndGettersForMyStashForMyTraits
]

{ #category : '*Stash-Serialization' }
Object >> allSetterAndGettersForMyStashForMyTraits [

	^ self class allTraits flatCollect: [ :traits |
		  traits localMethodDict
			  at: #allSetterAndGettersOfTraitForMyStash:
			  ifPresent: [ :method |
			  method valueWithReceiver: self arguments: { self } ]
			  ifAbsent: [ {  } ] ]
]

{ #category : '*Stash-Serialization' }
Object >> asStashContructor [

	self isLiteral ifTrue: [ ^ self printString ].
	^ self class printString , ' new'
]

{ #category : '*Stash-Serialization' }
Object >> asStashObject [

	^ StashObject new
		  object: self;
		  yourself
]

{ #category : '*Stash-Serialization' }
Object >> asStashProperty [
	^ StashSetterGetter new context: self; yourself
]

{ #category : '*Stash-Serialization' }
Object class >> isTaggedInStash [
^ false
]

{ #category : '*Stash-Serialization' }
Object >> onlyGetOnStash [

	^ StashOnlyGetter new
		  context: self;
		  yourself
]

{ #category : '*Stash-Serialization' }
Object >> onlySetOnStash [

	^ StashOnlySetter new
		  context: self;
		  yourself
]

{ #category : '*Stash-Serialization' }
Object >> shouldBeTagged [

	^ self isLiteral not
]
