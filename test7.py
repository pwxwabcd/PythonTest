L = ['Hello', 'World', 18, 'Apple', None]
print [s.lower() if isinstance(s, str) else s for s in L]