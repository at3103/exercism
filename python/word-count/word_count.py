import re
from collections import Counter 

def word_count(sentence):
	word_count =  Counter(re.split(r'[^a-zA-Z0-9]',sentence.lower()))
	del word_count['']
	return word_count
