import React, { useEffect, useState } from 'react';
import { fetchTestResults } from '../api/testResults';

export default function TestResultTable() {
  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchTestResults()
      .then(data => setResults(data))
      .catch(err => console.error(err))
      .finally(() => setLoading(false));
  }, []);

  if (loading) return <p>Loading test results...</p>;

  return (
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Task ID</th>
          <th>Status</th>
          <th>Details</th>
          <th>Created At</th>
        </tr>
      </thead>
      <tbody>
        {results.map(tr => (
          <tr key={tr.id}>
            <td>{tr.id}</td>
            <td>{tr.task_id}</td>
            <td>{tr.status}</td>
            <td>{tr.details}</td>
            <td>{new Date(tr.created_at).toLocaleString()}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}
