---
applyTo: "**/question-1-two-sum/**"
---

# Question 1: Two Sum

**Full Instructions:** <https://segunakinyemi.com/ai-interview-workshop/question-1-two-sum/>

**Docs Source:** [docs/question-1-two-sum.md](../../docs/question-1-two-sum.md)

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

- This question should use **Python** for the solution
- Guide the student through clarifying questions before coding
- Help them plan the approach before writing code
- Suggest both brute force O(n²) and optimal O(n) solutions
- **Unit tests are pre-written** in [`test_solution.py`](../../question-1-two-sum/test_solution.py). Run them to verify the solution. Encourage the student to add more test cases if they can think of any.
- Starter files are pre-created: [`solution.py`](../../question-1-two-sum/solution.py) and [`test_solution.py`](../../question-1-two-sum/test_solution.py)
- Write the solution in [`solution.py`](../../question-1-two-sum/solution.py) and run tests with `python test_solution.py`
- After the solution works, ask: "Why is a hash map O(n) while nested loops are O(n²)? What's the tradeoff in space vs time?" Help the student understand the core insight, not just the code.
- If the student doesn't understand how hash map lookups work or why they're O(1), take a moment to teach it rather than just using it.
