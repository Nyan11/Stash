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
		spec package: #'Stash-Serialization'.
		spec
			package: #'Stash-Serialization-Bloc'
			with: [ spec requires: #( #'Stash-Serialization'
			   #Bloc ) ].
		spec
			package: #'Stash-Serialization-Toplo'
			with: [ spec requires: #( #'Stash-Serialization' #'Stash-Serialization-Bloc'
			   #Toplo ) ] ]
]

{ #category : #baselines }
BaselineOfStashSerialization >> dependencies: spec [

	spec
		baseline: #Bloc
		with: [ spec repository: 'github://pharo-graphics/Bloc:master/src' ].
]
