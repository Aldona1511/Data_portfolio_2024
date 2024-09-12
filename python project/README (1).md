
Checking the strength of a password 


This program provides a simple yet effective way to assess the strength of a password based on its length and complexity.


My project has a main function and more additional functions as required.

Here's an explanation of each function in the password strength checking program and its role in assessing password strength:

1. main function:
   - The ‘main’ function is the entry point of the program.
   - It prompts the user to enter a password using the ‘input’ function.
   - Then, it calls the ‘password_strength’ function to evaluate the strength of the entered password.
   - Finally, it prints the strength of the password.

2. password_strength function:
   - The ‘password_strength’   function takes a password as input and assesses its strength based on predefined criteria.
   - It calls two helper functions, ‘check_length’ and ‘check_complexity’, to determine if the password meets requirements of the length and complexity.
   - If the password meets both conditions, it returns "Strong"; otherwise, it returns "Weak".

3. ‘check_length’ function:
   - The ‘check_length’ function checks if the length of the password is at least 8 characters.
   - It returns True if the password meets the length requirement; otherwise, it returns False.

4. ‘check_complexity’ function:
   - The ‘check_complexity’ function evaluates the complexity of the password by checking if it contains at least one uppercase letter, one lowercase letter, and one digit.
   - It uses Python's built-in string methods (‘isupper’, ‘islower’, ‘isdigi’) to check for the presence of uppercase letters, lowercase letters, and digits in the password.
   - If the password meets all three complexity criteria, the function returns True; otherwise, it returns False.

5. if __name__ == "__main__":
   - This conditional statement ensures that the `main` function is executed only when the program is run directly.
   - It calls the ‘main’ function, initiating the execution of the program.




Author Aldona Stolarz