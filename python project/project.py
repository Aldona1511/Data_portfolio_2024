import re

def main():
    password = input("Enter your password: ")
    strength = password_strength(password)
    print("Password strength:", strength)


def password_strength(password):
    length_criteria = has_minimum_length(password)
    uppercase_criteria = has_uppercase(password)
    lowercase_criteria = has_lowercase(password)
    digit_criteria = has_digit(password)
    special_char_criteria = has_special_character(password)
    

    if length_criteria and uppercase_criteria and lowercase_criteria and digit_criteria and special_char_criteria:
        return "Strong"
    else:
        return "Weak"

def has_minimum_length(password):
    return len(password) >= 8

def has_uppercase(password):
    return any(c.upper() for c in password)

def has_lowercase(password):
    return any(c.lower() for c in password)

def has_digit(password):
    return any(c.isdigit() for c in password)

def has_special_character(password):
    return bool(re.match(r'[!@#$%^&*(),.?":{}|<>]', password))

if __name__ == "__main__":
    main()


    def test_5():
    assert password_strength("password") == "Weak"
    assert password_strength("SecureP1wd!") == "Strong"