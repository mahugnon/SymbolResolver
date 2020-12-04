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
		with: [ spec
				repository:
					'github://moosetechnology/Famix:8701793dde7cf0b1ec908995763d9ea17134717e/src' ]
]
