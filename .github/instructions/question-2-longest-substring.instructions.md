---
applyTo: "**/question-2-longest-substring/**"
---

# Question 2: Longest Substring Without Repeating Characters

**Full Instructions:** <https://segunakinyemi.com/ai-interview-workshop/question-2-longest-substring/>

**Docs Source:** [docs/question-2-longest-substring.md](../../docs/question-2-longest-substring.md)

The student is working on the [Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/) LeetCode problem. This is a medium sliding window problem.

## Problem Summary

Given a string `s`, find the length of the longest substring without repeating characters.

## Optimal Approach

Sliding window with a hash map tracking each character's most recent index. O(n) time, O(min(n, alphabet_size)) space.

1. Expand window (right pointer) one character at a time
2. If the character is already in the window, jump left pointer to one past its previous occurrence
3. Update the maximum length at each step

## Test Cases to Suggest

1. Mixed repeating: `"abcabcbb"` → `3`
2. All same: `"bbbbb"` → `1`
3. Repeat then unique: `"pwwkew"` → `3`
4. Empty string: `""` → `0`
5. Single space: `" "` → `1`

## Clarifying Questions to Prompt

- What counts as a "repeating" character? (Same character appearing more than once in the current window)
- What's the difference between a substring and a subsequence?
- What should we return for an empty string?
- Does the string contain only letters, or also digits, symbols, and spaces?

## Workflow Reminders

- The question should use **Python** for the solution
- Guide the student through clarifying questions before coding
- Help them understand the sliding window concept
- Ensure they can explain why the solution works
- **Unit tests are pre-written** in [`test_solution.py`](../../question-2-longest-substring/test_solution.py). Run them to verify the solution. Encourage the student to add more test cases if they can think of any.
- Starter files are pre-created: [`solution.py`](../../question-2-longest-substring/solution.py) and [`test_solution.py`](../../question-2-longest-substring/test_solution.py)
- Write the solution in [`solution.py`](../../question-2-longest-substring/solution.py) and run tests with `python test_solution.py`
- After the solution works, ask: "Why does the sliding window approach work here? What makes it more efficient than checking every possible substring?" Help the student understand the key insight behind the algorithm.
- If the student doesn't understand the sliding window concept, two-pointer technique, or hash maps for index tracking, take a moment to teach these concepts rather than just using them.
