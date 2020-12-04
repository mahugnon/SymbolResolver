Class {
	#name : #BaselineOfSymbolResolver,
	#superclass : #BaselineOf,
	#category : #BaselineOfSymbolResolver
}

{ #category : #baselines }
BaselineOfSymbolResolver >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self baselineOfFamix: spec.
			spec
				package: 'SymbolResolver' with: [ spec requires: #('Famix') ];
				package: 'SymbolResolver-Tests'
					with: [ spec requires: #('SymbolResolver') ] ]
]

{ #category : #baselines }
BaselineOfSymbolResolver >> baselineOfFamix: spec [
	spec
    	baseline: 'Famix'
    	with: [ spec repository: 'github://moosetechnology/Famix:v1.0.0/src' ]
]
