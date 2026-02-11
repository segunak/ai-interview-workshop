# Question 2: Longest Substring Without Repeating Characters

> **Keep this file open while working on Question 2.** It loads the AI context GitHub Copilot needs to help you effectively.

> **Select the Workshop Agent** in the Copilot Chat panel for guided coaching through the question.

> These instructions are also available at <https://segunakinyemi.com/ai-interview-workshop/question-2-longest-substring/>.

**The AI Rule:** You can use AI for everything, but you must be able to explain everything your AI produces. Plan first, then prove it with tests. **[Your job is to deliver code you have proven to work](https://simonwillison.net/2025/Dec/18/code-proven-to-work/)**.

> This problem is based on [LeetCode #3: Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/).

## Problem Statement

This is a classic algorithm problem. Given a string `s`, find the length of the longest substring without repeating characters.

## Examples

**Example 1:**

```txt
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.
```

**Example 2:**

```txt
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
```

**Example 3:**

```txt
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
```

## Constraints

- 0 <= s.length <= 5 * 10^4
- s consists of English letters, digits, symbols, and spaces

## Workshop Workflow

### 1. Plan

Understand the problem before touching code. Think about edge cases and assumptions:

- What happens with an empty string?
- What if all characters are the same?
- What does "substring" mean vs "subsequence"?
- How do you know when a character is repeating?

This is a classic sliding window problem. Design your approach with Copilot:

- How do you track which characters are in the current window?
- When do you expand the window? When do you shrink it?
- How do you update the maximum length found so far?

### 2. Prove

Direct AI to write your solution in the starter files below. Before running anything, predict what the output will be. Then run the tests and verify your solution works with the provided examples and edge cases (empty string, all same characters, spaces and symbols).

### 3. Explain

After your solution works, reflect on:

1. **Why does a sliding window work here?** What makes it better than checking every possible substring?
2. **How do you detect a repeating character?** What data structure helps?
3. **What's the time complexity?** Why is it O(n) when there are two pointers moving?
4. **Could you solve this without the window?** What would brute force look like and why is it slower?

## Where to Write Your Code

Your solution goes in **`solution.py`** in this folder. Open that file and write your code there.

Tests are already written in `test_solution.py`. Once your solution is working, run them with:

```txt
python test_solution.py
```

## Hints

> Only look at hints if you're stuck!

<details>
<summary>Hint 1: Sliding Window</summary>

Use two pointers (left and right) to define a window. Expand right to include new characters. When you hit a repeat, move left until the duplicate is gone.

</details>

<details>
<summary>Hint 2: Tracking Characters</summary>

Use a set to track characters in the current window. Before adding a character, check if it already exists in the set. If it does, shrink the window from the left.

</details>

<details>
<summary>Hint 3: Optimization with a Hash Map</summary>

Instead of a set, use a dictionary mapping each character to its most recent index. When you find a repeat, jump left directly to one past the previous occurrence instead of shrinking one step at a time.

</details>
