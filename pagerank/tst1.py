import numpy as np
import pandas as pd

# Simulate reading the data from a CSV file
data = {
    'page': ['A', 'B', 'C', 'D'],
    'links': [['B', 'C'], ['C'], ['A'], ['B', 'C', 'A']],
    'num_links': [2, 1, 1, 3]
}
df = pd.DataFrame(data)

# Number of pages
N = len(df)
pages = df['page'].tolist()
page_index = {page: idx for idx, page in enumerate(pages)}

# Damping factor
damping_factor = 0.85
tolerance = 1e-6
max_iterations = 100

# Create the link matrix
link_matrix = np.zeros((N, N))
for _, row in df.iterrows():
    for link in row['links']:
        link_matrix[page_index[link], page_index[row['page']]] = 1 / row['num_links']

# Initialize PageRank values
PR = np.ones(N) / N

# Iterative updates
for _ in range(max_iterations):
    previous_PR = PR.copy()
    PR = (1 - damping_factor) / N + damping_factor * link_matrix @ PR
    if np.linalg.norm(PR - previous_PR) < tolerance:
        break

# Normalize
PR /= np.sum(PR)

# Display the PageRank values with corresponding pages
pagerank_results = {pages[i]: PR[i] for i in range(N)}
print(pagerank_results)







import pandas as pd

# Simulate reading the data from a CSV file
data = {
    'page': ['A', 'B', 'C', 'D'],
    'links': [['B', 'C'], ['C'], ['A'], ['B', 'C', 'A']],
    'num_links': [2, 1, 1, 3]
}
df = pd.DataFrame(data)

# Number of pages
N = len(df)
pages = df['page'].tolist()

# Damping factor
damping_factor = 0.85
tolerance = 1e-6
max_iterations = 100

# Initialize the link matrix
link_matrix = pd.DataFrame(0, index=pages, columns=pages, dtype=float)
for _, row in df.iterrows():
    for link in row['links']:
        link_matrix.at[link, row['page']] = 1 / row['num_links']

# Initialize PageRank values
PR = pd.Series(1.0 / N, index=pages)

# Iterative updates
for _ in range(max_iterations):
    previous_PR = PR.copy()
    PR = (1 - damping_factor) / N + damping_factor * link_matrix.dot(PR)
    if (PR - previous_PR).abs().sum() < tolerance:
        break

# Normalize
PR /= PR.sum()

# Display the PageRank values
print(PR.to_dict())
