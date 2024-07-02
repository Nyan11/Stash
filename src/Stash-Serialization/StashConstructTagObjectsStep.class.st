Class {
	#name : 'StashConstructTagObjectsStep',
	#superclass : 'StashStep',
	#category : 'Stash-Serialization-stash-steps',
	#package : 'Stash-Serialization',
	#tag : 'stash-steps'
}

{ #category : 'actions' }
StashConstructTagObjectsStep >> runOn: aStash [

	aStash taggedObject
		do: [ :each |
			aStash addOnSourceCode: each tag.
			aStash addOnSourceCode: ' := '.
			aStash addOnSourceCode: each constructor.
			aStash addOnSourceCode: '.' ]
		separatedBy: [ aStash addOnSourceCode: '<r>' ]
]
