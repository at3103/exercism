
def is_leap_year(year):
	# It is a leap year, if it is divisible only by 4 or if its divisible by all three - 4, 100 and 400
	return reduce(lambda acc,x: acc^(not(year%x)),[4, 100, 400], False)

