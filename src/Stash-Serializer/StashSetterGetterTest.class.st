Class {
	#name : #StashSetterGetterTest,
	#superclass : #TestCase,
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #tests }
StashSetterGetterTest >> testObject1 [

	| object source newObject |
	object := StashTesSetterGetter1 new
		          name: 'test1';
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTesSetterGetter1 new
   name: ''test1'';
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: 'test1'
]

{ #category : #tests }
StashSetterGetterTest >> testObject2 [

	| object source newObject |
	object := StashTesSetterGetter1 new
		          name: 'test1';
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTesSetterGetter1 new
   name: ''test1'';
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: 'test1'
]

{ #category : #tests }
StashSetterGetterTest >> testObject3 [

	| object source newObject |
	object := StashTesSetterGetter1 new.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTesSetterGetter1 new
   name: nil;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: nil
]

{ #category : #tests }
StashSetterGetterTest >> testObject4 [

	| object source newObject |
	object := StashTesSetterGetter1 new name:
		          (StashTesSetterGetter1 new name: 'test').
	source := Stash new serialize: object.
	self assert: source equals: 'StashTesSetterGetter1 new
   name: (StashTesSetterGetter1 new
         name: ''test'';
         yourself);
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name name equals: 'test'
]

{ #category : #tests }
StashSetterGetterTest >> testObject5 [

	| object source newObject |
	object := StashTesSetterGetter1 new.
	object name: object.
	source := Stash new serialize: object.
	self assert: source equals: '| stashobject1 |
stashobject1 := StashTesSetterGetter1 new.
stashobject1
   name: stashobject1;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: newObject
]

{ #category : #tests }
StashSetterGetterTest >> testObject6 [

	| object source newObject |
	object := StashTesSetterGetter2 new.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTesSetterGetter2 new
   name: nil;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: nil
]

{ #category : #tests }
StashSetterGetterTest >> testObject7 [

	| object source newObject |
	object := StashTesSetterGetter2 new
		          name: 'test1';
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTesSetterGetter2 new
   name: ''test1'';
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: 'test1'
]

{ #category : #tests }
StashSetterGetterTest >> testObject8 [

	| object source newObject |
	object := StashTesSetterGetter3 new.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTesSetterGetter3 new
   name: nil;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: nil
]

{ #category : #tests }
StashSetterGetterTest >> testObject9 [

	| object source newObject |
	object := StashTesSetterGetter3 new
		          name: 'test1';
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTesSetterGetter3 new
   name: ''test1'';
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: 'test1'
]
