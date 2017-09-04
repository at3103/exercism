from collections import defaultdict

def to_rna(dna):
	dna_complement = defaultdict(str,{'G':'C','C':'G','T':'A','A':'U'})
	rna = map(dna_complement.get, list(dna))
	try:
		return ''.join(rna)
	except:
		return ''
