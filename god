<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>Betting Bot - iPhone SE</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background: #000000;
            color: #ffffff;
            padding: 16px;
            padding-bottom: 80px;
        }

        /* Status Bar Spacing */
        .status-bar {
            height: 44px;
        }

        /* Header */
        .header {
            text-align: center;
            padding: 20px 0;
        }

        .header h1 {
            font-size: 28px;
            font-weight: 700;
            background: linear-gradient(135deg, #34C759, #007AFF);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Stats Grid - 2 columns for iPhone SE */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
            margin-bottom: 20px;
        }

        .stat-card {
            background: #1c1c1e;
            border-radius: 12px;
            padding: 16px;
            text-align: center;
        }

        .stat-value {
            font-size: 24px;
            font-weight: 700;
            color: #34C759;
        }

        .stat-label {
            font-size: 12px;
            color: #8e8e93;
            margin-top: 4px;
        }

        /* Tabs - Scrollable for small screen */
        .tabs {
            display: flex;
            gap: 8px;
            margin-bottom: 16px;
            overflow-x: auto;
            scrollbar-width: none;
            -webkit-overflow-scrolling: touch;
        }

        .tabs::-webkit-scrollbar {
            display: none;
        }

        .tab-btn {
            background: #1c1c1e;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            color: #8e8e93;
            font-size: 14px;
            font-weight: 500;
            white-space: nowrap;
            cursor: pointer;
        }

        .tab-btn.active {
            background: #007AFF;
            color: #ffffff;
        }

        /* Cards */
        .card {
            background: #1c1c1e;
            border-radius: 12px;
            padding: 16px;
            margin-bottom: 12px;
        }

        .opportunity-item {
            background: #1c1c1e;
            border-radius: 12px;
            padding: 16px;
            margin-bottom: 12px;
            border-left: 4px solid #34C759;
        }

        .opportunity-sport {
            font-size: 12px;
            color: #8e8e93;
            text-transform: uppercase;
        }

        .opportunity-selection {
            font-size: 16px;
            font-weight: 600;
            margin: 8px 0;
        }

        .opportunity-odds {
            font-size: 20px;
            font-weight: 700;
        }

        .ev-positive {
            color: #34C759;
        }

        .ev-negative {
            color: #FF3B30;
        }

        .confidence-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 600;
        }

        .confidence-elite { background: #34C75920; color: #34C759; }
        .confidence-high { background: #007AFF20; color: #007AFF; }
        .confidence-medium { background: #FF9F0A20; color: #FF9F0A; }
        .confidence-low { background: #FF3B3020; color: #FF3B30; }

        /* Bet Row */
        .bet-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 0.5px solid #2c2c2e;
        }

        .bet-info {
            flex: 1;
        }

        .bet-selection {
            font-size: 15px;
            font-weight: 500;
        }

        .bet-details {
            font-size: 12px;
            color: #8e8e93;
            margin-top: 4px;
        }

        .bet-status {
            font-size: 13px;
            font-weight: 600;
        }

        .status-won { color: #34C759; }
        .status-lost { color: #FF3B30; }
        .status-pending { color: #FF9F0A; }

        /* Buttons */
        .btn {
            background: #007AFF;
            border: none;
            padding: 14px;
            border-radius: 12px;
            color: white;
            font-size: 16px;
            font-weight: 600;
            width: 100%;
            cursor: pointer;
            margin-bottom: 12px;
        }

        .btn-danger {
            background: #FF3B30;
        }

        .btn-secondary {
            background: #2c2c2e;
            color: #007AFF;
        }

        /* Inputs */
        input, select {
            background: #2c2c2e;
            border: none;
            padding: 14px;
            border-radius: 10px;
            color: white;
            font-size: 16px;
            width: 100%;
            margin-bottom: 12px;
        }

        /* Bottom Navigation */
        .bottom-nav {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(28, 28, 30, 0.95);
            backdrop-filter: blur(10px);
            display: flex;
            justify-content: space-around;
            padding: 10px 0;
            border-top: 0.5px solid #2c2c2e;
        }

        .nav-item {
            text-align: center;
            cursor: pointer;
            padding: 8px;
        }

        .nav-icon {
            font-size: 22px;
        }

        .nav-label {
            font-size: 10px;
            margin-top: 4px;
            color: #8e8e93;
        }

        .nav-item.active .nav-label {
            color: #007AFF;
        }

        /* Tab Content */
        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
            animation: fadeIn 0.3s;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Alert Banner */
        .alert-banner {
            background: #34C75920;
            border-radius: 10px;
            padding: 12px;
            margin-bottom: 12px;
            font-size: 13px;
            border-left: 3px solid #34C759;
        }
    </style>
</head>
<body>
    <div class="status-bar"></div>
    
    <div class="header">
        <h1>🎯 Betting Bot</h1>
    </div>

    <!-- Stats -->
    <div class="stats-grid" id="statsGrid">
        <div class="stat-card">
            <div class="stat-value" id="bankroll">$10,000</div>
            <div class="stat-label">Bankroll</div>
        </div>
        <div class="stat-card">
            <div class="stat-value" id="totalBets">0</div>
            <div class="stat-label">Total Bets</div>
        </div>
        <div class="stat-card">
            <div class="stat-value" id="profit">$0</div>
            <div class="stat-label">Profit</div>
        </div>
        <div class="stat-card">
            <div class="stat-value" id="roi">0%</div>
            <div class="stat-label">ROI</div>
        </div>
    </div>

    <!-- Alert Banner -->
    <div id="alertBanner" class="alert-banner" style="display: none;"></div>

    <!-- Tab Content -->
    <div id="opportunities-tab" class="tab-content active">
        <div id="opportunitiesList"></div>
        <button class="btn" onclick="refreshOpportunities()">🔄 Refresh</button>
    </div>

    <div id="bets-tab" class="tab-content">
        <button class="btn" onclick="showAddBetModal()">➕ Add Bet</button>
        <div id="betsList"></div>
    </div>

    <div id="analyzer-tab" class="tab-content">
        <div class="card">
            <input type="number" id="oddsInput" placeholder="Odds (-110 or +150)" value="-110">
            <input type="number" id="edgeInput" placeholder="Edge %" value="5" step="1">
            <button class="btn" onclick="calculateEV()">Calculate EV</button>
            <div id="evResult" style="margin-top: 16px;"></div>
        </div>
    </div>

    <div id="settings-tab" class="tab-content">
        <div class="card">
            <h3 style="margin-bottom: 16px;">Bankroll</h3>
            <input type="number" id="bankrollSetting" placeholder="Bankroll">
            <button class="btn" onclick="updateBankroll()">Update</button>
        </div>
        <div class="card">
            <h3 style="margin-bottom: 16px;">Risk Settings</h3>
            <input type="number" id="maxStake" placeholder="Max Stake %" step="1">
            <input type="number" id="minEV" placeholder="Min EV %" step="0.5">
            <button class="btn" onclick="saveRiskSettings()">Save</button>
        </div>
    </div>

    <!-- Bottom Navigation -->
    <div class="bottom-nav">
        <div class="nav-item active" onclick="switchTab('opportunities')">
            <div class="nav-icon">🎯</div>
            <div class="nav-label">Opportunities</div>
        </div>
        <div class="nav-item" onclick="switchTab('bets')">
            <div class="nav-icon">📋</div>
            <div class="nav-label">Bets</div>
        </div>
        <div class="nav-item" onclick="switchTab('analyzer')">
            <div class="nav-icon">📊</div>
            <div class="nav-label">EV</div>
        </div>
        <div class="nav-item" onclick="switchTab('settings')">
            <div class="nav-icon">⚙️</div>
            <div class="nav-label">Settings</div>
        </div>
    </div>

    <script>
        // Data storage
        let bets = [];
        let settings = {
            bankroll: 10000,
            maxStakePct: 5,
            minEV: 2
        };

        // Load saved data
        function loadData() {
            const savedBets = localStorage.getItem('ios_bets');
            if (savedBets) bets = JSON.parse(savedBets);
            
            const savedSettings = localStorage.getItem('ios_settings');
            if (savedSettings) settings = { ...settings, ...JSON.parse(savedSettings) };
            
            document.getElementById('bankrollSetting').value = settings.bankroll;
            document.getElementById('maxStake').value = settings.maxStakePct;
            document.getElementById('minEV').value = settings.minEV;
            
            updateStats();
            renderBets();
        }

        function saveData() {
            localStorage.setItem('ios_bets', JSON.stringify(bets));
            localStorage.setItem('ios_settings', JSON.stringify(settings));
        }

        function updateStats() {
            const totalBets = bets.length;
            const totalProfit = bets.reduce((sum, b) => sum + (b.profit || 0), 0);
            const roi = totalBets > 0 ? (totalProfit / settings.bankroll * 100).toFixed(1) : 0;
            
            document.getElementById('bankroll').innerHTML = `$${(settings.bankroll + totalProfit).toLocaleString()}`;
            document.getElementById('totalBets').innerHTML = totalBets;
            document.getElementById('profit').innerHTML = `$${totalProfit.toLocaleString()}`;
            document.getElementById('roi').innerHTML = `${roi}%`;
        }

        function showAlert(message, isError = false) {
            const banner = document.getElementById('alertBanner');
            banner.style.display = 'block';
            banner.style.background = isError ? '#FF3B3020' : '#34C75920';
            banner.style.borderLeftColor = isError ? '#FF3B30' : '#34C759';
            banner.innerHTML = message;
            setTimeout(() => {
                banner.style.display = 'none';
            }, 3000);
        }

        // Generate mock opportunities
        function generateOpportunities() {
            const sports = ['NBA', 'NFL', 'NHL', 'MLB'];
            const teams = ['Lakers', 'Warriors', 'Chiefs', 'Dodgers', 'Bruins'];
            const opps = [];
            
            for (let i = 0; i < 10; i++) {
                const sport = sports[Math.floor(Math.random() * sports.length)];
                const selection = teams[Math.floor(Math.random() * teams.length)];
                const odds = Math.random() > 0.5 ? -Math.floor(Math.random() * 200 + 100) : Math.floor(Math.random() * 200 + 100);
                const ev = (Math.random() * 15 - 3).toFixed(1);
                const confidence = ev > 10 ? 'elite' : ev > 5 ? 'high' : ev > 2 ? 'medium' : 'low';
                
                opps.push({ sport, selection, odds, ev: parseFloat(ev), confidence });
            }
            return opps.sort((a, b) => b.ev - a.ev);
        }

        function refreshOpportunities() {
            const opps = generateOpportunities();
            const container = document.getElementById('opportunitiesList');
            
            container.innerHTML = opps.map(opp => `
                <div class="opportunity-item">
                    <div class="opportunity-sport">${opp.sport}</div>
                    <div class="opportunity-selection">${opp.selection} to win</div>
                    <div class="opportunity-odds ${opp.odds > 0 ? 'ev-positive' : ''}">${opp.odds > 0 ? '+' : ''}${opp.odds}</div>
                    <div style="margin: 8px 0;">
                        <span class="ev-${opp.ev > 0 ? 'positive' : 'negative'}">EV: ${opp.ev > 0 ? '+' : ''}${opp.ev}%</span>
                        <span class="confidence-badge confidence-${opp.confidence}" style="margin-left: 8px;">${opp.confidence.toUpperCase()}</span>
                    </div>
                    <button class="btn" onclick="placeBet('${opp.selection}', ${opp.odds}, ${opp.ev})" style="margin-top: 8px;">Place Bet</button>
                </div>
            `).join('');
            
            showAlert('🔄 Opportunities refreshed');
        }

        function placeBet(selection, odds, ev) {
            const stake = Math.floor(settings.bankroll * (settings.maxStakePct / 100));
            const bet = {
                id: Date.now(),
                date: new Date().toISOString(),
                selection: selection,
                odds: odds,
                stake: stake,
                ev: ev,
                status: 'pending',
                profit: null
            };
            bets.unshift(bet);
            saveData();
            renderBets();
            updateStats();
            showAlert(`✅ Bet placed on ${selection} @ ${odds > 0 ? '+' : ''}${odds} for $${stake}`);
            switchTab('bets');
        }

        function showAddBetModal() {
            const selection = prompt('Selection:', '');
            if (!selection) return;
            const odds = parseInt(prompt('Odds:', '-110'));
            if (isNaN(odds)) return;
            const stake = parseFloat(prompt('Stake $:', '100'));
            if (isNaN(stake)) return;
            
            const bet = {
                id: Date.now(),
                date: new Date().toISOString(),
                selection: selection,
                odds: odds,
                stake: stake,
                ev: 0,
                status: 'pending',
                profit: null
            };
            bets.unshift(bet);
            saveData();
            renderBets();
            updateStats();
            showAlert(`📝 Manual bet added: ${selection}`);
        }

        function updateBetStatus(betId, status) {
            const bet = bets.find(b => b.id === betId);
            if (bet) {
                bet.status = status;
                if (status === 'won') {
                    bet.profit = bet.stake * (bet.odds > 0 ? bet.odds/100 : 100/abs(bet.odds));
                } else if (status === 'lost') {
                    bet.profit = -bet.stake;
                }
                saveData();
                renderBets();
                updateStats();
                showAlert(`📊 Bet marked as ${status.toUpperCase()}`);
            }
        }

        function deleteBet(betId) {
            if (confirm('Delete this bet?')) {
                bets = bets.filter(b => b.id !== betId);
                saveData();
                renderBets();
                updateStats();
                showAlert('🗑️ Bet deleted');
            }
        }

        function renderBets() {
            const container = document.getElementById('betsList');
            
            if (bets.length === 0) {
                container.innerHTML = '<div class="card" style="text-align: center;">No bets yet</div>';
                return;
            }
            
            container.innerHTML = bets.map(bet => `
                <div class="card">
                    <div class="bet-row">
                        <div class="bet-info">
                            <div class="bet-selection">${bet.selection}</div>
                            <div class="bet-details">
                                ${bet.odds > 0 ? '+' : ''}${bet.odds} | $${bet.stake} | EV: ${bet.ev > 0 ? '+' : ''}${bet.ev}%
                            </div>
                        </div>
                        <div class="bet-status status-${bet.status}">${bet.status.toUpperCase()}</div>
                    </div>
                    <div style="display: flex; gap: 8px; margin-top: 12px;">
                        <select onchange="updateBetStatus(${bet.id}, this.value)" style="flex: 1; margin: 0;">
                            <option ${bet.status === 'pending' ? 'selected' : ''}>pending</option>
                            <option ${bet.status === 'won' ? 'selected' : ''}>won</option>
                            <option ${bet.status === 'lost' ? 'selected' : ''}>lost</option>
                        </select>
                        <button onclick="deleteBet(${bet.id})" style="background: #FF3B30; padding: 10px 16px; margin: 0;">Delete</button>
                    </div>
                </div>
            `).join('');
        }

        function calculateEV() {
            const odds = parseInt(document.getElementById('oddsInput').value);
            const edgePct = parseFloat(document.getElementById('edgeInput').value);
            
            let impliedProb;
            if (odds > 0) {
                impliedProb = 100 / (odds + 100);
            } else {
                impliedProb = Math.abs(odds) / (Math.abs(odds) + 100);
            }
            
            const trueProb = Math.min(0.95, impliedProb * (1 + edgePct / 100));
            const decimalOdds = odds > 0 ? 1 + (odds / 100) : 1 + (100 / Math.abs(odds));
            const ev = (trueProb * decimalOdds - 1) * 100;
            
            const resultDiv = document.getElementById('evResult');
            resultDiv.innerHTML = `
                <div style="background: #2c2c2e; padding: 16px; border-radius: 12px;">
                    <p>Odds: ${odds > 0 ? '+' : ''}${odds}</p>
                    <p>Implied: ${(impliedProb * 100).toFixed(1)}%</p>
                    <p>True Prob: ${(trueProb * 100).toFixed(1)}%</p>
                    <p style="font-size: 24px; font-weight: 700; color: ${ev > 0 ? '#34C759' : '#FF3B30'}">
                        EV: ${ev > 0 ? '+' : ''}${ev.toFixed(1)}%
                    </p>
                    ${ev > 0 ? '<p style="color: #34C759;">✅ Value Bet</p>' : '<p style="color: #FF3B30;">❌ No Value</p>'}
                </div>
            `;
        }

        function updateBankroll() {
            const newBankroll = parseFloat(document.getElementById('bankrollSetting').value);
            if (!isNaN(newBankroll)) {
                settings.bankroll = newBankroll;
                saveData();
                updateStats();
                showAlert(`💰 Bankroll updated to $${newBankroll.toLocaleString()}`);
            }
        }

        function saveRiskSettings() {
            settings.maxStakePct = parseFloat(document.getElementById('maxStake').value);
            settings.minEV = parseFloat(document.getElementById('minEV').value);
            saveData();
            showAlert('✅ Risk settings saved');
        }

        function switchTab(tabName) {
            document.querySelectorAll('.tab-content').forEach(tab => tab.classList.remove('active'));
            document.querySelectorAll('.nav-item').forEach(item => item.classList.remove('active'));
            
            document.getElementById(`${tabName}-tab`).classList.add('active');
            event.target.closest('.nav-item').classList.add('active');
        }

        // Initial load
        loadData();
        refreshOpportunities();
        
        // Refresh opportunities every 60 seconds
        setInterval(() => {
            if (document.getElementById('opportunities-tab').classList.contains('active')) {
                refreshOpportunities();
            }
        }, 60000);
    </script>
</body>
</html>