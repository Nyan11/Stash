Class {
	#name : 'StashSetterGetterTest',
	#superclass : 'TestCase',
	#category : 'Stash-Serialization-test-cases',
	#package : 'Stash-Serialization',
	#tag : 'test-cases'
}

{ #category : 'tests' }
StashSetterGetterTest >> testObject1 [

	| object source newObject |
	object := StashTestSetterGetter1 new
		          name: 'test1';
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestSetterGetter1 new
   name: ''test1'';
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: 'test1'
]

{ #category : 'tests' }
StashSetterGetterTest >> testObject2 [

	| object source newObject |
	object := StashTestSetterGetter1 new
		          name: 'test1';
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestSetterGetter1 new
   name: ''test1'';
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: 'test1'
]

{ #category : 'tests' }
StashSetterGetterTest >> testObject3 [

	| object source newObject |
	object := StashTestSetterGetter1 new.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestSetterGetter1 new
   name: nil;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: nil
]

{ #category : 'tests' }
StashSetterGetterTest >> testObject4 [

	| object source newObject |
	object := StashTestSetterGetter1 new name:
		          (StashTestSetterGetter1 new name: 'test').
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestSetterGetter1 new
   name: (StashTestSetterGetter1 new
         name: ''test'';
         yourself);
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name name equals: 'test'
]

{ #category : 'tests' }
StashSetterGetterTest >> testObject5 [

	| object source newObject |
	object := StashTestSetterGetter1 new.
	object name: object.
	source := Stash new serialize: object.
	self assert: source equals: '| stashtestsettergetter11 |
stashtestsettergetter11 := StashTestSetterGetter1 new.
stashtestsettergetter11
   name: stashtestsettergetter11;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: newObject
]

{ #category : 'tests' }
StashSetterGetterTest >> testObject6 [

	| object source newObject |
	object := StashTestSetterGetter2 new.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestSetterGetter2 new
   name: nil;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: nil
]

{ #category : 'tests' }
StashSetterGetterTest >> testObject7 [

	| object source newObject |
	object := StashTestSetterGetter2 new
		          name: 'test1';
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestSetterGetter2 new
   name: ''test1'';
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: 'test1'
]

{ #category : 'tests' }
StashSetterGetterTest >> testObject8 [

	| object source newObject |
	object := StashTestSetterGetter3 new.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestSetterGetter3 new
   name: nil;
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: nil
]

{ #category : 'tests' }
StashSetterGetterTest >> testObject9 [

	| object source newObject |
	object := StashTestSetterGetter3 new
		          name: 'test1';
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'StashTestSetterGetter3 new
   name: ''test1'';
   yourself'.

	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject name equals: 'test1'
]
