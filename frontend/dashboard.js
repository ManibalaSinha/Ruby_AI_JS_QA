fetch('/api/results')
  .then(res => res.json())
  .then(data => {
    const container = document.getElementById('results');
    data.forEach(test => {
      const div = document.createElement('div');
      div.innerHTML = `<b>${test.url}</b>: ${test.status}`;
      container.appendChild(div);
    });
  });
