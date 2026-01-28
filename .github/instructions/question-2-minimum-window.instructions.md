---
applyTo: "**/question-2-minimum-window/**"
---

# Question 2: Minimum Window Substring

The student is working on the [Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/) LeetCode problem. This is a hard sliding window problem.

## Problem Summary

Given strings `s` and `t`, return the minimum window substring of `s` that contains all characters in `t` (including duplicates). Return empty string if no such window exists.

## Optimal Approach

Sliding window with two pointers and character frequency maps. O(n) time, O(k) space where k is charset size.

1. Expand window (right pointer) until all chars are covered
2. Contract window (left pointer) while maintaining validity
3. Track the minimum valid window seen

## Test Cases to Suggest

1. Basic: `s="ADOBECODEBANC", t="ABC"` → `"BANC"`
2. Exact match: `s="a", t="a"` → `"a"`
3. No solution: `s="a", t="aa"` → `""`
4. Duplicates in t: `s="aa", t="aa"` → `"aa"`

## Clarifying Questions to Prompt

- Are characters case-sensitive?
- What if t has duplicate characters?
- What if s and t are the same string?
- Should I return the substring or its indices?

## Workflow Reminders

This is a HARD problem. The AI will likely help significantly. That's okay. Focus on:
- Guiding the student through clarifying questions before coding
- Helping them understand the sliding window concept
- Ensuring they can explain why the solution works
- Encouraging comprehensive tests
