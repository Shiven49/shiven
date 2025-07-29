import os
from resume_core import extract_text_from_pdf, load_skills, match_skills, recommend_roles

skills = load_skills("skills_directory.json")
folder = "resumes"
output_folder = "results"

if not os.path.exists(output_folder):
    os.makedirs(output_folder)

for filename in os.listdir(folder):
    if filename.endswith(".pdf"):
        path = os.path.join(folder, filename)
        text = extract_text_from_pdf(path)
        results = match_skills(text, skills)
        top_roles = recommend_roles(results)

        base_name = os.path.splitext(filename)[0]
        output_path = os.path.join(output_folder, f"results_{base_name}.txt")

        with open(output_path, "w") as f:
            f.write(f"Resume: {filename}\n")

            if top_roles:
                best_role, best_score = top_roles[0]
                total_keywords = len(skills[best_role])
                percentage = round((best_score))
                f.write(f"Suggested Job Role: {best_role} \n\n")
                f.write("Top Matches:\n")
                for role, score in top_roles:
                    percent = round((score / len(skills[role])) * 100)
                    f.write(f"- {role}: {percent}% match ({score}/{len(skills[role])} skills)\n")
            else:
                f.write("No matching roles found.\n")

        print(f"Result saved to: {output_path}")
