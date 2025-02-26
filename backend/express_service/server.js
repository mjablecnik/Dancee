const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

app.get('/api/message', (req, res) => {
    res.json({ message: 'Toto je GET request!' });
});

app.post('/api/message', (req, res) => {
  const { name, server } = req.body;
    res.json({ name: name, server: server });
});

app.listen(port, () => {
    console.log(`Server běží na http://localhost:${port}`);
});

