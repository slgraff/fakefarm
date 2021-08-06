function boom(chapter) {
  fetch(`http://localhost:8000/isaiah/${chapter}/data.js`)
    .then(response => response.json())
    .then(data => {
      return data
    });
}

function title(content) {
  return ejs.render('<h1><%= title %></h1>', {title: content});
}

function body(content) {
 return ejs.render('<p><%= title %></p>', {title: content});
}


var b = boom(61);
console.log(b)
// debugger