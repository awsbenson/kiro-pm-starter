import { useState } from 'react'
import './App.css'
import AlertDashboard from './components/AlertDashboard'
import Sidebar from './components/Sidebar'

function App() {
  const [currentPage, setCurrentPage] = useState('alerts')

  return (
    <div className="app">
      <Sidebar currentPage={currentPage} onNavigate={setCurrentPage} />
      <main className="main-content">
        <header className="top-bar">
          <h1>TrendAI Vision One</h1>
          <span className="user-badge">PM Demo Mode</span>
        </header>
        <div className="page-content">
          {currentPage === 'alerts' && <AlertDashboard />}
          {currentPage === 'rules' && <div className="placeholder">Suppression Rules — coming soon</div>}
          {currentPage === 'reports' && <div className="placeholder">Reports — coming soon</div>}
        </div>
      </main>
    </div>
  )
}

export default App
