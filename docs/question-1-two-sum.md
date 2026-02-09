---
title: "Question 1: Two Sum"
nav_order: 3
---

# Question 1: Two Sum

{: .important }
**Before you start:** Make sure you've selected the **Workshop Agent** in GitHub Copilot Chat. Open `QUESTION-1-START-HERE.md` in the `question-1-two-sum` folder and keep it open while you work. This loads the AI context GitHub Copilot needs to help you effectively.

![How to select the Workshop Agent in VS Code](images/Workshop-Agent-Picked-VS-Code.png)

{: .note }
**Model tip:** For best results, select **Claude Sonnet 4.5** from the model picker in Copilot Chat. If you run out of premium requests, switch to **Raptor mini** or **GPT-5 mini**, which are free and unlimited.

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

### 1. Plan

Understand the problem before touching code. Think about edge cases and assumptions:

- Can the array contain negative numbers?
- What if the array is empty or has only one element?
- Can there be duplicate values?
- Do I return indices or values?

Then design your approach with Copilot:

- What data structure would help you quickly check if the number you need has already appeared?
- What's the time complexity of a brute force approach?
- Can you do better than O(n²)?

### 2. Prove

Direct AI to write your solution in the [`question-1-two-sum/`](../question-1-two-sum/) folder. Before running anything, predict what the output will be. Then run the tests and verify your solution works.

### 3. Explain

Be ready to articulate:

- Time complexity
- Space complexity
- Why you chose this approach

## Deliverables

Your solution goes in **`solution.py`** in the `question-1-two-sum/` folder. Open that file and write your code there.

Tests are already written in `test_solution.py`. Once your solution is working, run them with:

```txt
python test_solution.py
```

## Hints

{: .note }
Only look at hints if you're stuck!

<details>
<summary>Hint 1: Data Structure</summary>

A hash map (dictionary in Python) can help you look up values in O(1) time.

</details>

<details>
<summary>Hint 2: What to Store</summary>

For each number, there's another number that would pair with it to hit the target. For example, if your target is 9 and you're looking at 2, you need a 7. That "other number" is just `target - current number`. In programming, this is called the **complement**. What if you stored numbers you've seen so far so you could instantly check whether the one you need has already shown up?

</details>

<details>
<summary>Hint 3: One Pass Solution</summary>

You can solve this in a single pass through the array. For each number, check if the other number you need (`target - current number`) is already in your hash map. If it's not there yet, add the current number to the map and keep going.

</details>
