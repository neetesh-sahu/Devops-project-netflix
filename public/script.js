fetch('/api/movies')
  .then(res => res.json())
  .then(data => {
    const container = document.getElementById('movies');

    data.results.forEach(movie => {
      const div = document.createElement('div');
      div.className = 'card';

      div.innerHTML = `
        <img src="https://image.tmdb.org/t/p/w500${movie.poster_path}" />
      `;

      container.appendChild(div);
    });
  });