import express from 'express';
import data from './data/data.json'

const app = express();
const PORT = 3000;

app.get('/', (req, res) => {

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

