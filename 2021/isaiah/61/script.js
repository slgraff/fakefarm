async function getUsers(chapter) {
    let url = `http://localhost:8000/2021/isaiah/${chapter}/data.js`;
    try {
        let res = await fetch(url);
        return await res.json();
    } catch (error) {
        console.log(error);
    }
}

async function renderUsers(chapter) {
    let users = await getUsers(chapter);

    let html = '';
    users.forEach(user => {
      let htmlSegment = `
        <div class="user">
            <h2>${user.no}</h2>
            <div class="email">${user.text}</div>
        </div>
        `;
      html += htmlSegment;
    });

    let container = document.querySelector('.container');
    container.innerHTML = html;
}

renderUsers(61);
