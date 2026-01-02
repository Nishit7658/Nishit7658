import matplotlib.pyplot as plt

# Data
categories = ["Efficiency Gains", "Smarter Decisions", "Global Collaboration", "Cost Optimization", "Challenges"]
values = [90, 85, 80, 75, 50]  # Scores (out of 100)

# Plot
plt.figure(figsize=(8,5))
plt.bar(categories, values)
plt.title("Benefits vs Challenges of New Technology")
plt.xlabel("Factors")
plt.ylabel("Impact Score (out of 100)")
plt.ylim(0, 100)
plt.xticks(rotation=30)

# Save
plt.tight_layout()
plt.savefig("benefits_vs_challenges.png")
plt.show()