Extension { #name : #Object }

{ #category : #'*SymbolResolver' }
Object >> asSREntityScope [
	^SREntityScope new
		entity: self ;
		yourself
]

{ #category : #'*SymbolResolver' }
Object >> isNullPatternObject [
	^ false
]
