// src/api/api.js
const BASE_URL = "http://localhost:3000";

export async function fetchTestResults() {
  const res = await fetch(`${BASE_URL}/test_results`);
  if (!res.ok) throw new Error("Failed to fetch test results");
  return res.json();
}

export async function createTestResult(data) {
  const res = await fetch(`${BASE_URL}/test_results`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  });
  if (!res.ok) throw new Error("Failed to create test result");
  return res.json();
}
