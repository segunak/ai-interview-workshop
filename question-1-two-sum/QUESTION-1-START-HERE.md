# Question 1: Two Sum

> **Keep this file open while working on Question 1.** It loads the AI context GitHub Copilot needs to help you effectively.

> **Select the Workshop Agent** in the Copilot Chat panel for guided coaching through the question.

> These instructions are also available at <https://segunakinyemi.com/ai-interview-workshop/question-1-two-sum/>.

**The AI Rule:** You can use AI for everything, but you must be able to explain everything your AI produces. Plan first, then prove it with tests. **[Your job is to deliver code you have proven to work](https://simonwillison.net/2025/Dec/18/code-proven-to-work/)**.

> This problem is based on [LeetCode #1: Two Sum](https://leetcode.com/problems/two-sum/).

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

Direct AI to write your solution in the starter files below. Before running anything, predict what the output will be. Then run the tests and verify your solution works.

### 3. Explain

Be ready to articulate:

- Time complexity
- Space complexity
- Why you chose this approach

## Where to Write Your Code

Your solution goes in **`solution.py`** in this folder. Open that file and write your code there.

Tests are already written in `test_solution.py`. Once your solution is working, run them with:

```txt
python test_solution.py
```

## Hints

> Only look at hints if you're stuck!

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
