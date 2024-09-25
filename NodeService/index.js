const express = require('express');
const app = express();
const port = 2000;

app.get('/', (req, res) => {
  console.log(req.method); 
  res.send('Hello World! Con otro cambio del serviceeee con cambio de usuario!');
});

app.listen(port, () => console.log(`Listening on port ${port}`));


