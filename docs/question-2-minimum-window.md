---
title: "Question 2: Minimum Window"
nav_order: 4
---

# Question 2: Minimum Window Substring

{: .important }
**Before you start:** In your VS Code window, Open `QUESTION-2-START-HERE.md` in the `question-2-minimum-window` folder and keep it open while you work. This loads the AI context GitHub Copilot needs to help you effectively.

{: .note }
This problem is based on [LeetCode #76: Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/).

## Problem Statement

This is a classic algorithm problem. Given two strings `s` and `t`, return the minimum window substring of `s` such that every character in `t` (including duplicates) is included in the window.

If there is no such substring, return an empty string `""`.

## Examples

**Example 1:**

```txt
Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
```

**Example 2:**

```txt
Input: s = "a", t = "a"
Output: "a"
Explanation: The entire string s is the minimum window.
```

**Example 3:**

```txt
Input: s = "a", t = "aa"
Output: ""
Explanation: Both 'a's from t must be included in the window.
Since s only has one 'a', return empty string.
```

**Example 4 (Duplicates in Both Strings):**

```txt
Input: s = "aa", t = "aa"
Output: "aa"
Explanation: The window must contain both 'a's from t.
The entire string s is the minimum valid window.
```

## Constraints

- 1 <= s.length, t.length <= 10^5
- s and t consist of uppercase and lowercase English letters

## Workshop Workflow

### 1. Ask Clarifying Questions

Before coding, consider:

- Are characters case-sensitive?
- What if t has duplicate characters?
- What if s and t are the same string?
- Should I return the substring or its indices?

### 2. Plan Your Approach

This is a classic sliding window problem. Discuss with Copilot:

- How do you know when your window contains all required characters?
- When do you expand the window? When do you contract it?
- How do you track the minimum window found so far?

### 3. Implement and Test

Create your solution in [`question-2-minimum-window/`](../question-2-minimum-window/). Test with:

- The provided examples
- Edge cases (single character, no valid window, entire string is the answer)

## Reflection Prompts

After completing your solution, reflect on these questions:

1. **Why is this considered a hard problem?** What makes sliding window tricky here compared to simpler sliding window problems?

2. **How do you track "all characters present"?** What data structures help you efficiently check if your window is valid?

3. **What's the time complexity?** Why is it O(n) even though you might visit some characters multiple times?

4. **Could you solve this without the optimization?** What would a brute force approach look like, and why is it too slow?

## Deliverables

Your solution goes in **[`solution.py`](../question-2-minimum-window/solution.py)** in the [`question-2-minimum-window/`](../question-2-minimum-window/) folder. Open that file and write your code there.

Tests are already written in [`test_solution.py`](../question-2-minimum-window/test_solution.py). Once your solution is working, run them with:

```
python test_solution.py
```

## Hints

{: .note }
Only look at hints if you're stuck!

<details>
<summary>Hint 1: Two Pointers</summary>

Use two pointers (left and right) to define your current window. Expand right to include more characters, contract left to find the minimum.

</details>

<details>
<summary>Hint 2: Tracking Requirements</summary>

Use a dictionary to count how many of each character from t you still need. When all counts reach zero or below, your window is valid.

</details>

<details>
<summary>Hint 3: Optimization</summary>

Keep track of how many unique characters from t are "satisfied" (count in window >= count needed). When satisfied count equals unique characters in t, your window is valid.

</details>
