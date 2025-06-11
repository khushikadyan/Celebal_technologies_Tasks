if __name__ == '__main__':
    n = int(input("Enter the number of Students :"))
    student_marks = {}
    for _ in range(n):
        # Read each student's name and their marks
        name, *line = input("Enter the name:").split()
        scores = list(map(float, line))
        student_marks[name] = scores

    query_name = input("select the student you want to calculate average of :")  # The student name to query

    # Calculate average marks for the queried student
    marks = student_marks[query_name]
    average = sum(marks) / len(marks)

    # Print average with 2 decimal places
    print("Results:")
    print(f"{average:.2f}")
