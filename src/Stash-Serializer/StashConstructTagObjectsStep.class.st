Class {
	#name : #StashConstructTagObjectsStep,
	#superclass : #StashStep,
	#category : #'Stash-Serializer-stash'
}

{ #category : #actions }
StashConstructTagObjectsStep >> runOn: aStash [

	aStash taggedObject
		do: [ :each |
			aStash addOnSourceCode: each tag.
			aStash addOnSourceCode: ' := '.
			aStash addOnSourceCode: each object asStashContructor.
			aStash addOnSourceCode: '.' ]
		separatedBy: [ aStash addOnSourceCode: '<r>' ]
]
