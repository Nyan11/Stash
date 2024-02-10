Class {
	#name : #StashBlocChildrenTest,
	#superclass : #TestCase,
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #tests }
StashBlocChildrenTest >> testBlElementChildren1 [

	| object source |
	object := BlElement new.
	source := Stash new serialize: object.
	self
		assert: source
		equals: 'BlElement new'
]

{ #category : #tests }
StashBlocChildrenTest >> testBlElementChildren2 [

	| object source |
	object := BlElement new
		          addChild: BlElement new;
		          yourself.
	source := Stash new serialize: object.
	self
		assert: source
		equals: 'BlElement new
   addChildren: {BlElement new};
   yourself'
]

{ #category : #tests }
StashBlocChildrenTest >> testBlElementChildren3 [

	| object source |
	object := BlElement new
		          addChild: BlElement new;
		          addChild: BlElement new;
		          addChild: BlElement new;
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   addChildren: {BlElement new . 
      BlElement new . 
      BlElement new};
   yourself'
]

{ #category : #tests }
StashBlocChildrenTest >> testBlElementChildren4 [

	| object source |
	object := BlElement new
		          addChild: BlElement new;
		          addChild: (BlElement new addChild: BlElement new; yourself);
		          addChild: BlElement new;
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   addChildren: {BlElement new . 
      (BlElement new
         addChildren: {BlElement new};
         yourself) . 
      BlElement new};
   yourself'
]
