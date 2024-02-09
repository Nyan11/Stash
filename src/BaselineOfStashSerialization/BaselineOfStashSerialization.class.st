Class {
	#name : #BaselineOfStashSerialization,
	#superclass : #BaselineOf,
	#category : #BaselineOfStashSerialization
}

{ #category : #baselines }
BaselineOfStashSerialization >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self dependencies: spec.
		spec package: #'Stash-Serialization' with: [ spec requires: #(  #Bloc  ) ] ]
]

{ #category : #baselines }
BaselineOfStashSerialization >> dependencies: spec [

	spec
		baseline: #Bloc
		with: [ spec repository: 'github://pharo-graphics/Bloc:dev-1.0/src' ].
]
