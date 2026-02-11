"""
Tests for Question 2: Longest Substring Without Repeating Characters

Run with: python test_solution.py
"""

from solution import length_of_longest_substring

# Test 1: Mixed repeating characters
assert length_of_longest_substring("abcabcbb") == 3, "Mixed repeating failed"

# Test 2: All same characters
assert length_of_longest_substring("bbbbb") == 1, "All same characters failed"

# Test 3: Repeating with non-repeating end
assert length_of_longest_substring("pwwkew") == 3, "Repeating with non-repeating end failed"

# Test 4: Empty string
assert length_of_longest_substring("") == 0, "Empty string failed"

# Test 5: Single character
assert length_of_longest_substring(" ") == 1, "Single space failed"

# TODO: Add more test cases as needed

print("All tests passed!")
