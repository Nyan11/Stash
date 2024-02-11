Class {
	#name : #StashTestOnlySet1,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #'as yet unclassified' }
StashTestOnlySet1 >> allSetterAndGettersForMyStash [

	^ { ([ :testObject |
	   testObject state
		   ifTrue: [ #stateTrue ]
		   ifFalse: [ #stateFalse ] ] -> self) onlySetOnStash }
]

{ #category : #initialization }
StashTestOnlySet1 >> initialize [

	state := false
]

{ #category : #accessing }
StashTestOnlySet1 >> state [

	^ state
]

{ #category : #'as yet unclassified' }
StashTestOnlySet1 >> stateFalse [

	state := false
]

{ #category : #'as yet unclassified' }
StashTestOnlySet1 >> stateTrue [

	state := true
]
