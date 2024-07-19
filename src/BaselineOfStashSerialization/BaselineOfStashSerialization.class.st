Class {
	#name : #BaselineOfStashSerialization,
	#superclass : #BaselineOf,
	#category : #BaselineOfStashSerialization
}

{ #category : #baselines }
BaselineOfStashSerialization >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec package: #'Stash-Serialization'.
	 ]
]
