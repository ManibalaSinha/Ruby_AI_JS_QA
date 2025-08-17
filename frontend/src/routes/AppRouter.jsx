import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Dashboard from '../pages/Dashboard';
import TasksPage from '../pages/TasksPage';
import ProjectsPage from '../pages/ProjectsPage';
import UsersPage from '../pages/UsersPage';
import ReportsPage from '../pages/ReportsPage';

export default function AppRouter() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Dashboard />} />
        <Route path="/tasks" element={<TasksPage />} />
        <Route path="/projects" element={<ProjectsPage />} />
        <Route path="/users" element={<UsersPage />} />
        <Route path="/reports" element={<ReportsPage />} />
      </Routes>
    </BrowserRouter>
  );
}
