import axios from 'axios';

const API_BASE = import.meta.env.VITE_API_URL || 'http://localhost:3000';

export const fetchTestResults = async () => {
  try {
    const res = await axios.get(`${API_BASE}/test_results`);
    return res.data;
  } catch (err) {
    console.error('Error fetching test results:', err);
    throw err;
  }
};

export const createTestResult = async (data) => {
  try {
    const res = await axios.post(`${API_BASE}/test_results`, data);
    return res.data;
  } catch (err) {
    console.error('Error creating test result:', err);
    throw err;
  }
};
