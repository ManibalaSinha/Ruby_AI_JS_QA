import { useEffect, useState } from 'react';
import { fetchTestResults } from '../api/testResults';
import TestResultReport from '../components/TestResultReport';

export default function TestResultsPage() {
  const [results, setResults] = useState([]);

  useEffect(() => {
    const loadResults = async () => {
      const data = await fetchTestResults();
      setResults(data);
    };
    loadResults();
  }, []);

  return (
    <div>
      <h1>Test Results</h1>
      {results.map(tr => (
        <TestResultReport key={tr.id} testResult={tr} />
      ))}
    </div>
  );
}
