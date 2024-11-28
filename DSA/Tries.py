class Solution:
    def replaceWords(self, dictionary: List[str], sentence: str) -> str:
        rootset=set(dictionary)
        def replace(word):
            for i in range(1,len(word)+1):
                if word[:i] in rootset:
                    return word[:i]
            return word
        result= [replace(word) for word in sentence.split()]
        return ' '.join(result)

