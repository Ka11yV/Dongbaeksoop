document.addEventListener('DOMContentLoaded', () => {
    // Default to lecture tab
    switchTab('lecture');

    // Initialize User Growth Chart
    initUserGrowthChart();
});

function switchTab(tabName) {
    // Hide all content sections
    const contents = ['lecture', 'user', 'notice', 'stats'];
    contents.forEach(content => {
        const element = document.getElementById(`content-${content}`);
        if (element) {
            element.classList.add('hidden');
        }
    });

    // Show selected content
    const selectedContent = document.getElementById(`content-${tabName}`);
    if (selectedContent) {
        selectedContent.classList.remove('hidden');
    }

    // Update tab styles
    contents.forEach(content => {
        const tab = document.getElementById(`tab-${content}`);
        if (tab) {
            if (content === tabName) {
                tab.classList.remove('text-[#86868B]', 'hover:text-black');
                tab.classList.add('bg-white', 'text-black', 'shadow-sm');
            } else {
                tab.classList.add('text-[#86868B]', 'hover:text-black');
                tab.classList.remove('bg-white', 'text-black', 'shadow-sm');
            }
        }
    });
}

function initUserGrowthChart() {
    const ctx = document.getElementById('userGrowthChart');
    if (!ctx) return;

    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월'],
            datasets: [{
                label: '신규 가입자',
                data: [65, 78, 90, 85, 98, 112],
                borderColor: '#0071E3', // Apple System Blue
                backgroundColor: 'rgba(0, 113, 227, 0.1)',
                borderWidth: 3,
                tension: 0.4,
                fill: true,
                pointBackgroundColor: '#ffffff',
                pointBorderColor: '#0071E3',
                pointBorderWidth: 2,
                pointRadius: 4,
                pointHoverRadius: 6
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    backgroundColor: 'rgba(0, 0, 0, 0.8)',
                    padding: 12,
                    titleFont: {
                        size: 14,
                        family: "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
                    },
                    bodyFont: {
                        size: 13,
                        family: "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
                    },
                    cornerRadius: 8,
                    displayColors: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(0, 0, 0, 0.05)',
                        drawBorder: false
                    },
                    ticks: {
                        font: {
                            family: "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
                        }
                    }
                },
                x: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        font: {
                            family: "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
                        }
                    }
                }
            },
            interaction: {
                intersect: false,
                mode: 'index'
            }
        }
    });
}
