"""
Tests for Question 1: Two Sum

Run with: python test_solution.py
"""

from solution import two_sum

# Test 1: Basic case
assert two_sum([2, 7, 11, 15], 9) == [0, 1], "Basic case failed"

# Test 2: Non-adjacent elements
assert two_sum([3, 2, 4], 6) == [1, 2], "Non-adjacent elements failed"

# Test 3: Negative numbers
assert two_sum([-1, -2, -3, -4, -5], -8) == [2, 4], "Negative numbers failed"

# TODO: Add more test cases as needed

print("All tests passed!")
