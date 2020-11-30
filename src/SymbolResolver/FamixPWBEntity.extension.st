Extension { #name : #FamixPWBEntity }

{ #category : #'*SymbolResolver' }
FamixPWBEntity >> asSREntityScope [
	^SREntityScope new
		entity: self ;
		yourself
]
