import PyPDF2
import json

def extract_text_from_pdf(pdf_path):
    text = ""
    with open(pdf_path, "rb") as file:
        reader = PyPDF2.PdfReader(file)
        for page in reader.pages:
            text += page.extract_text() or ""
    return text.lower()

def load_skills(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        return json.load(f)


def match_skills(resume_text, skills_dict):
    results = {}
    for role, keywords in skills_dict.items():
        match_count = sum(1 for skill in keywords if skill.lower() in resume_text)
        if match_count > 0:
            results[role] = match_count
    return results

def recommend_roles(results_dict):
    return sorted(results_dict.items(), key=lambda x: x[1], reverse=True)
