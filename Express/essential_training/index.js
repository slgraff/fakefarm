import express from 'express';
import data from './data/data.json'

const app = express();
const PORT = 3000;

// use is the term to introduce middleware.
// if there is not path, then it will hinge on '/'
app.use(express.static('public'));

// apply a path like so.
app.use('/img', express.static('img'))


app.get('/', (req, res) => {
  // normally, get data first
  res.json(data)
});

app.post('/newItem', (req, res) => {
  res.send(`a post request on port ${PORT}, with req: ${req}`)
});

app.put('/item', (req, res) => {
  res.send(`a put request on port ${PORT}`)
});

app.delete('/item', (req, res) => {
  res.send(`a delete request with /item on port ${PORT}`)
});

app.listen(PORT, () => {
  console.log(`your server is running on port ${PORT}`)
  console.log(data)
 });

