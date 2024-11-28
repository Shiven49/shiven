def simplify(S):
    S=list(S)
    i=0
    while i<len(S)-1:
        if S[i]=='1' and S[i+1]=='0':
            S.pop(i)
            i=max(i-1,0)
        else:
            i=i+1
    return ''.join(S)
test_cases = [
    "101",
    "110",
    "1001",
    "11001",
    "111000"
]

results = [simplify(tc) for tc in test_cases]
print(results)