import { useState } from 'react'

const SAMPLE_ALERTS = [
  { id: 1, severity: 'high', title: 'Suspicious lateral movement detected', source: 'cloud-workload-01', time: '2 min ago', status: 'open' },
  { id: 2, severity: 'medium', title: 'Unusual API call pattern', source: 'endpoint-srv-12', time: '5 min ago', status: 'open' },
  { id: 3, severity: 'low', title: 'Failed login attempt (3rd today)', source: 'auth-gateway', time: '12 min ago', status: 'open' },
  { id: 4, severity: 'high', title: 'Malware signature match', source: 'endpoint-ws-44', time: '18 min ago', status: 'open' },
  { id: 5, severity: 'medium', title: 'Data exfiltration attempt blocked', source: 'network-fw-02', time: '25 min ago', status: 'open' },
  { id: 6, severity: 'low', title: 'Certificate expiry warning', source: 'web-proxy-01', time: '1 hr ago', status: 'open' },
  { id: 7, severity: 'low', title: 'Scheduled scan completed', source: 'endpoint-srv-08', time: '2 hr ago', status: 'dismissed' },
  { id: 8, severity: 'low', title: 'Known benign: backup service auth', source: 'cloud-workload-03', time: '3 hr ago', status: 'dismissed' },
]

export default function AlertDashboard() {
  const [alerts, setAlerts] = useState(SAMPLE_ALERTS)
  const [selected, setSelected] = useState([])
  const [filter, setFilter] = useState('all')

  const filteredAlerts = alerts.filter(a => {
    if (filter === 'all') return true
    if (filter === 'open') return a.status === 'open'
    if (filter === 'dismissed') return a.status === 'dismissed'
    return a.severity === filter
  })

  const toggleSelect = (id) => {
    setSelected(prev => prev.includes(id) ? prev.filter(x => x !== id) : [...prev, id])
  }

  const dismissSelected = () => {
    setAlerts(prev => prev.map(a => selected.includes(a.id) ? { ...a, status: 'dismissed' } : a))
    setSelected([])
  }

  return (
    <div className="alert-dashboard">
      <div className="dashboard-header">
        <h2>Alert Dashboard</h2>
        <div className="filter-bar">
          {['all', 'open', 'high', 'medium', 'low', 'dismissed'].map(f => (
            <button
              key={f}
              className={`filter-btn ${filter === f ? 'active' : ''}`}
              onClick={() => setFilter(f)}
            >
              {f.charAt(0).toUpperCase() + f.slice(1)}
            </button>
          ))}
        </div>
      </div>

      {selected.length > 0 && (
        <div className="bulk-actions">
          <span>{selected.length} selected</span>
          <button className="btn-dismiss" onClick={dismissSelected}>
            Dismiss Selected
          </button>
        </div>
      )}

      <table className="alert-table">
        <thead>
          <tr>
            <th><input type="checkbox" onChange={(e) => setSelected(e.target.checked ? filteredAlerts.map(a => a.id) : [])} /></th>
            <th>Severity</th>
            <th>Alert</th>
            <th>Source</th>
            <th>Time</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          {filteredAlerts.map(alert => (
            <tr key={alert.id} className={`severity-${alert.severity}`}>
              <td><input type="checkbox" checked={selected.includes(alert.id)} onChange={() => toggleSelect(alert.id)} /></td>
              <td><span className={`severity-badge ${alert.severity}`}>{alert.severity}</span></td>
              <td>{alert.title}</td>
              <td className="source">{alert.source}</td>
              <td className="time">{alert.time}</td>
              <td><span className={`status-badge ${alert.status}`}>{alert.status}</span></td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
