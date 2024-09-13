import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('C:\\data\\student_performance_dataset.csv')

# Convert relevant columns to NumPy arrays
math_scores = np.array(df['Math_Score'])
english_scores = np.array(df['English_Score'])
science_scores = np.array(df['Science_Score'])
study_hours = np.array(df['Study_Hours'])
attendance = np.array(df['Attendance (%)'])

# Converting 'M' to 0 and  'F' to 1
genders = np.array([0 if gender == 'M' else 1 for gender in genders])

# Calculate basic statistics
math_mean = np.mean(math_scores)
english_mean = np.mean(english_scores)
science_mean = np.mean(science_scores)



math_std = np.std(math_scores)
english_std = np.std(english_scores)
science_std = np.std(science_scores)

#Correlation between study hours and score
study_math_corr = np.corrcoef(study_hours, math_scores)[0,1]
study_english_corr = np.corrcoef(study_hours, english_scores)[0,1]
study_science_corr = np.corrcoef(study_hours, science_scores)[0,1]

# Correlation between attendance and scores
attendance_math_corr = np.corrcoef(attendance, math_scores)[0,1]
attendance_english_corr = np.corrcoef(attendance, english_scores)[0,1]
attendance_science_corr = np.corrcoef(attendance, science_scores)[0,1]

print(f"Mean Math Score:{math_mean}, Std:{math_std}")
print(f"Correlation between Study Hours and Math Score:{study_math_corr}")

# Identify students with very low or very high scores in each subject, outliers
low_scores = np.where((math_scores<60)(english_scores<60)(science_scores<60))
high_scores = np.where((math_scores<90)(english_scores<90)(science_scores<90))

print(f"Students with low scores:{low_scores}")
print(f"Students with high scores:{high_scores}")

#Simple  linear regression(study vs math scores)
slope, intercept = np.polyfit(study_hours, math_scores, 1)
print(f"Regression line:Math_Score = {slope}*Study_Hours + {intercept}")

# Scatter plot of study hours vs math scores
plt.scatter(study_hours, math_scores, label='Data points')
plt.plot(study_hours, slope*study_hours + intercept, colour='red',label='Regression line')

plt.label('Study Hours')
plt.ylabel('Math Scores')
plt.title('Relationship between Study Hours and Math Scores')
plt.legend()
plt.show()
