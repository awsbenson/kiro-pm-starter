export default function Sidebar({ currentPage, onNavigate }) {
  const navItems = [
    { id: 'alerts', label: '🔔 Alerts', count: 247 },
    { id: 'rules', label: '📋 Suppression Rules', count: 12 },
    { id: 'reports', label: '📊 Reports', count: null },
  ]

  return (
    <aside className="sidebar">
      <div className="sidebar-logo">🛡️ TrendAI</div>
      <nav>
        {navItems.map(item => (
          <button
            key={item.id}
            className={`nav-item ${currentPage === item.id ? 'active' : ''}`}
            onClick={() => onNavigate(item.id)}
          >
            {item.label}
            {item.count && <span className="badge">{item.count}</span>}
          </button>
        ))}
      </nav>
    </aside>
  )
}
