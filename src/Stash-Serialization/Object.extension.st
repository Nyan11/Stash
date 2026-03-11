Extension { #name : #Object }

{ #category : #'*Stash-Serialization' }
Object class >> allGettersForMyStash [

	^ self allSetterAndGettersForMyStash collect: #value.
]

{ #category : #'*Stash-Serialization' }
Object >> allSetterAndGettersForMyStash [

	| pragmas methods methodDict |
	pragmas := Pragma
		           allNamed: #stashAccessors
		           from: self class
		           to: Object.
	methods := pragmas collect: #method.
	methodDict := Dictionary new.
	methods do: [ :currentMethod |
			methodDict
				at: currentMethod selector
				ifPresent: [ :previousMethod |
						(currentMethod methodClass inheritsFrom: previousMethod)
							ifTrue: [
							methodDict at: currentMethod selector put: currentMethod ] ]
				ifAbsentPut: [ currentMethod ] ].

	^ methodDict values flatCollect: [ :method |
		  method
			  receiver: self
			  withArguments: #(  )
			  executeMethod: method ]
]

{ #category : #'*Stash-Serialization' }
Object >> asStashConstructor [

	self isLiteral ifTrue: [ ^ self printString ].
	^ self class printString , ' new'
]

{ #category : #'*Stash-Serialization' }
Object >> asStashObject [

	^ StashObject new
		  object: self;
		  yourself
]

{ #category : #'*Stash-Serialization' }
Object >> asStashProperty [
	^ StashSetterGetter new context: self; yourself
]

{ #category : #'*Stash-Serialization' }
Object class >> isTaggedInStash [
^ false
]

{ #category : #'*Stash-Serialization' }
Object >> onlyGetOnStash [

	^ StashOnlyGetter new
		  context: self;
		  yourself
]

{ #category : #'*Stash-Serialization' }
Object >> onlySetOnStash [

	^ StashOnlySetter new
		  context: self;
		  yourself
]

{ #category : #'*Stash-Serialization' }
Object >> shouldBeTagged [

	^ self isLiteral not
]
