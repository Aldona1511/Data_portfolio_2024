import password_strenght 

def test_has_minimum_length():
    assert password_strength.has_minimum_length("password") == False
    assert password_strength.has_minimum_length("securepwd") == True

def test_has_uppercase():
    assert password_strength.has_uppercase("password") == False
    assert password_strength.has_uppercase("SecurePwd") == True

def test_has_lowercase():
    assert password_strength.has_lowercase("PASSWORD") == False
    assert password_strength.has_lowercase("SecurePwd") == True

def test_has_digit():
    assert password_strength.has_digit("password") == False
    assert password_strength.has_digit("SecurePwd123") == True

def test_has_special_character():
    assert password_strength.has_special_character("password") == False
    assert password_strength.has_special_character("SecurePwd!") == True