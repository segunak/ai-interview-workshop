/*
 * Question 4: Post to Live Feed
 *
 * POST a message to the live feed API and verify it exists in the database.
 *
 * Full Instructions: https://segunakinyemi.com/ai-interview-workshop/question-4-live-feed/
 *
 * Run with: node post.js
 */

const config = require("../workshop-config.json");
const BASE_URL = config.liveFeedUrl;
const WORKSHOP_KEY = config.workshopKey;

/**
 * Post a message to the live feed and verify it exists in the database.
 *
 * @param {string} name - Your name or alias.
 * @param {string} message - The message to post.
 * @param {string} workshop - Workshop name.
 * @param {string} tags - Optional comma-separated tags for your post.
 */
async function postMessage(name, message, workshop = "AI Interview Workshop", tags = "") {
    // TODO: Implement your solution here
    // Step 1: POST to create the message using fetch
    // Step 2: Parse the response and extract the post ID
    // Step 3: Wait a few seconds for the database to process
    // Step 4: GET to verify the post exists using the ID
    // Step 5: Only print success after verification confirms the post is in the database
}

postMessage("Your Name Here", "Hello from JavaScript!");
