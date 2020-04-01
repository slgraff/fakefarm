var content, article_wrapper, h1, p;

tinyxhr("../server/data.json",
  function (err,data,xhr) {
    if (err) console.log("goterr ",err);
    content = JSON.parse(data);
    article_wrapper = document.getElementById("article")
    content.forEach(function(f) {
      h1 = document.createElement('h1')
      p = document.createElement('p')
      h1.innerText = f.title
      p.innerText = f.body
      article_wrapper.append(h1)
      article_wrapper.append(p)
    })
    }
);