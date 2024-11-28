#def main():
#    print("hello world")
#    corpus = {"1" : ("2", "3"), "2" : ("3"), "3" : ("2") }
#    ProbDist = {}
#    for link in corpus["1"]:
#        PageProb = (0.85/len(corpus["1"])) + ((1-0.85)/len(corpus))
#        ProbDist[link] = PageProb
#    for page in corpus:
#        if page not in ProbDist:
#            ProbDist[page] = (1-0.85)/len(corpus)
#    print(ProbDist)
#main()
#def main():
#    print("hello world")
#    corpus = {"1": ("2", "3"), "2": ("3"), "3": ("2")}
#    ProbDist = {}
#    
#    # Iterating over each page in the corpus
#    for page in corpus:
#        PageProb = 0  # Initializing the probability for the current page
#        links = corpus[page]  # Getting the links associated with the current page
#        
#        # Calculating the probability contribution from each link
#        for link in links:
#            PageProb += 0.85 * (1 / len(corpus[link]))  # Adding the PageRank contribution from the link
#        
#        # Adding the teleportation probability and storing it in the probability distribution
#        PageProb += (1 - 0.85) / len(corpus)
#        ProbDist[page] = PageProb
#        
#    print(ProbDist)
#
#main()
#
import random
import pandas as pd
def main():
    print("hello world")
    corpus = {"1" : ("2" , "3"), "2" : ("3"), "3" : ("2") }
    damping = 0.85
    prob = transition_model(corpus,"1" , damping)
    print(prob)
def transition_model(corpus, page, damping_factor): 
    """
    Return a probability distribution over which page to visit next,
    given a current page.

    With probability `damping_factor`, choose a link at random
    linked to by `page`. With probability `1 - damping_factor`, choose
    a link at random chosen from all pages in the corpus.
    """
    #TO-DO 
    ProbDist = {}
    if len(corpus[page]) != 0:
        for link in corpus[page]:
            PageProb = (damping_factor/len(corpus[page])) + ((1-damping_factor)/len(corpus))
            ProbDist[link] = PageProb
        for page in corpus:
            if page not in ProbDist:
                ProbDist[page] = (1-damping_factor)/len(corpus)
    else:
        for link in corpus:
            ProbDist[link] = 1/len(corpus)
    key_order = corpus.keys()
    finalProbDist = {}
    for p in key_order:
        finalProbDist[p] = ProbDist[p]
    return finalProbDist
def iterate_pagerank(corpus, damping_factor):
    """
    Return PageRank values for each page by iteratively updating
    PageRank values until convergence.

    Return a dictionary where keys are page names, and values are
    their estimated PageRank value (a value between 0 and 1). All
    PageRank values should sum to 1.
    """
    #To-Do
    num_links = []
    for links in corpus.values():
        num_links.append(len(links))
    df = pd.DataFrame({'page': corpus.keys(),
                       'links': corpus.values(),
                       'num_links': num_links
                       })
    N =len(df)
    tolerance = 1e-6
    pages = corpus.keys()
    connecting_matrix = pd.DataFrame(0, index = pages, column = pages, dtype = float)
    for index, row in df.itterrows():
        for link in row['links']:
            print(row['page'])
            connecting_matrix.at[link,row['page']] = 1/len(link)
    return 0

main()