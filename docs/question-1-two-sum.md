---
title: "Question 1: Two Sum"
nav_order: 3
---

# Question 1: Two Sum

{: .important }
**Before you start:** In your VS Code window, Open `QUESTION-1-START-HERE.md` in the `question-1-two-sum` folder and keep it open while you work. This loads the AI context GitHub Copilot needs to help you effectively.

{: .note }
This problem is based on [LeetCode #1: Two Sum](https://leetcode.com/problems/two-sum/).

## Problem Statement

This is a classic algorithm problem. Given an array of integers `nums` and an integer `target`, return the indices of the two numbers that add up to `target`.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

## Examples

**Example 1:**

```txt
Input: nums = [2, 7, 11, 15], target = 9
Output: [0, 1]
Explanation: nums[0] + nums[1] = 2 + 7 = 9
```

**Example 2:**

```txt
Input: nums = [3, 2, 4], target = 6
Output: [1, 2]
Explanation: nums[1] + nums[2] = 2 + 4 = 6
```

**Example 3:**

```txt
Input: nums = [3, 3], target = 6
Output: [0, 1]
```

**Example 4 (Negative Numbers):**

```txt
Input: nums = [-1, -2, -3, -4, -5], target = -8
Output: [2, 4]
Explanation: nums[2] + nums[4] = -3 + -5 = -8
```

## Constraints

- 2 <= nums.length <= 10^4
- -10^9 <= nums[i] <= 10^9
- -10^9 <= target <= 10^9
- Only one valid answer exists

## Workshop Workflow

Before you start coding, follow this workflow:

### 1. Ask Clarifying Questions

Think about edge cases and assumptions. Some questions to consider:

- Can the array contain negative numbers?
- What if the array is empty or has only one element?
- Can there be duplicate values?
- Do I return indices or values?

### 2. Plan Your Approach

Discuss your strategy with Copilot before writing code. Consider:

- What data structure would help you find complements quickly?
- What's the time complexity of a brute force approach?
- Can you do better than O(n²)?

### 3. Implement and Test

Create your solution in the [`question-1-two-sum/`](../question-1-two-sum/) folder. Include tests for:

- The provided examples
- Edge cases (duplicates, negative numbers, large arrays)

### 4. Explain Your Solution

Be ready to articulate:

- Time complexity
- Space complexity
- Why you chose this approach

## Deliverables

Create your solution in the [`question-1-two-sum/`](../question-1-two-sum/) folder. Starter files are already there:

- [`solution.py`](../question-1-two-sum/solution.py) - Write your solution here
- [`test_solution.py`](../question-1-two-sum/test_solution.py) - Tests are pre-written, they'll pass when your solution works

Run tests with: `python test_solution.py`

## Hints

{: .note }
Only look at hints if you're stuck!

<details>
<summary>Hint 1: Data Structure</summary>

A hash map (dictionary in Python) can help you look up values in O(1) time.

</details>

<details>
<summary>Hint 2: What to Store</summary>

For each number, you need to find its complement (target - num). What if you stored numbers you've seen so far?

</details>

<details>
<summary>Hint 3: One Pass Solution</summary>

You can solve this in a single pass through the array. For each number, check if its complement is already in your hash map. If not, add the current number to the map.

</details>
