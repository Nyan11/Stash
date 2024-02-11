Extension { #name : #Object }

{ #category : #'*Stash-Serializer' }
Object class >> allGettersForMyStash [

	^ self allSetterAndGettersForMyStash collect: #value.
]

{ #category : #'*Stash-Serializer' }
Object >> allSetterAndGettersForMyStash [

	^ #()
]

{ #category : #'*Stash-Serializer' }
Object >> asStashContructor [

	self isLiteral ifTrue: [ ^ self printString ].
	^ self class printString , ' new'
]

{ #category : #'*Stash-Serializer' }
Object >> asStashObject [

	^ StashObject new
		  object: self;
		  yourself
]

{ #category : #'*Stash-Serializer' }
Object >> asStashProperty [
	^ StashSetterGetter new context: self; yourself
]

{ #category : #'*Stash-Serializer' }
Object class >> isTaggedInStash [
^ false
]

{ #category : #'*Stash-Serializer' }
Object >> shouldBeTagged [

	^ self isLiteral not
]
