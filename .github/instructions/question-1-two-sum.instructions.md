---
applyTo: "**/question-1-two-sum/**"
---

# Question 1: Two Sum

The student is working on the classic [Two Sum](https://leetcode.com/problems/two-sum/) LeetCode problem.

## Problem Summary

Given an array of integers `nums` and an integer `target`, return the indices of two numbers that add up to target.

- Exactly one solution exists
- Cannot use the same element twice
- Return indices, not values

## Optimal Approach

Use a hash map to store complements. O(n) time, O(n) space.

## Test Cases to Suggest

1. Basic case: `nums=[2,7,11,15], target=9` → `[0,1]`
2. Numbers not adjacent: `nums=[3,2,4], target=6` → `[1,2]`
3. Negative numbers: `nums=[-1,-2,-3,-4,-5], target=-8` → `[2,4]`

## Clarifying Questions to Prompt

- Can the array contain negative numbers?
- What if the array is empty or has only one element?
- Can there be duplicate values?
- Do I return indices or values?

## Workflow Reminders

- Ask which language the student prefers before showing code
  - **Python** (default) or **JavaScript**
- Guide the student through clarifying questions before coding
- Help them plan the approach before writing code
- Suggest both brute force O(n²) and optimal O(n) solutions
- **Unit tests are required.** Use simple assert statements, no pytest or jest.
- File names: `solution.py` + `test_solution.py` or `solution.js` + `test_solution.js`
