Class {
	#name : #StashTestOnlySet2,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #'Stash-Serialization-test-cases'
}

{ #category : #'as yet unclassified' }
StashTestOnlySet2 >> allSetterAndGettersForMyStash [

	self state ifFalse: [ ^ {  } ].
	^ { [ :testObject |
	   testObject state
		   ifTrue: [ #stateTrue ]
		   ifFalse: [ #stateFalse ] ] onlySetOnStash }
]

{ #category : #initialization }
StashTestOnlySet2 >> initialize [

	state := false.
]

{ #category : #accessing }
StashTestOnlySet2 >> state [

	^ state
]

{ #category : #'as yet unclassified' }
StashTestOnlySet2 >> stateFalse [

	state := false
]

{ #category : #'as yet unclassified' }
StashTestOnlySet2 >> stateTrue [

	state := true.
]
