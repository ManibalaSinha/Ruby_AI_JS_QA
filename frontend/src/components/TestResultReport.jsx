export default function TestResultReport({ testResult }) {
  return (
    <div className="card">
      <h2>Task ID: {testResult.task_id}</h2>
      <p>Status: {testResult.status}</p>
      <p>Details: {testResult.details}</p>
    </div>
  );
}
