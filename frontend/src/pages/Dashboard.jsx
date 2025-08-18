import { useEffect, useState } from 'react';
import { fetchTestResults, createTestResult } from '../api/api';

export default function Dashboard() {
  const [results, setResults] = useState([]);

  useEffect(() => {
    fetchTestResults().then(setResults).catch(console.error);
  }, []);

  return (
    <>
      <h1>Dashboard</h1>
      <ul>
        {results.map((r) => (
          <li key={r.id}>
            {r.status} - {r.details}
          </li>
        ))}
      </ul>
      <button onClick={() => createTestResult({ status: 'New', details: 'Test' }).then(fetchTestResults).then(setResults)}>
        Add Test Result
      </button>
    </>
  );
}
