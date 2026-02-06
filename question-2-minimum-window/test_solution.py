"""
Tests for Question 2: Minimum Window Substring

Run with: python test_solution.py
"""

from solution import min_window

# Test 1: Basic case
assert min_window("ADOBECODEBANC", "ABC") == "BANC", "Basic case failed"

# Test 2: Exact match
assert min_window("a", "a") == "a", "Exact match failed"

# Test 3: No valid window
assert min_window("a", "aa") == "", "No valid window failed"

# Test 4: Duplicates in both strings
assert min_window("aa", "aa") == "aa", "Duplicates failed"

# TODO: Add more test cases as needed

print("All tests passed!")
