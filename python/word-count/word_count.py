import re
from collections import Counter 

def update_count(wrd_dict, word):
	# Ignore empty char
	if word:
		wrd_dict[word] += 1
	return wrd_dict

def word_count(sentence):
	word_list = re.split(r'[^a-zA-Z0-9]',sentence.lower())
	return reduce(update_count, word_list, Counter())
