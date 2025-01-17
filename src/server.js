const express = require('express');
    const bodyParser = require('body-parser');
    const { execSync } = require('child_process');

    const app = express();
    const port = 3000;

    app.use(bodyParser.json());

    app.post('/api/chat', (req, res) => {
      const question = req.body.question;
      // Simulate PyTorch chatbot response
      const response = `Simulated response to: ${question}`;
      res.json({ answer: response });
    });

    app.post('/api/recommend', (req, res) => {
      const person = req.body.person;
      const command = `swipl -s src/prolog/gift_advisor.pl -g "recommend_gift(${person}, Gift), writeln(Gift), halt." -t halt`;
      const output = execSync(command).toString().trim();
      res.json({ gift: output });
    });

    app.listen(port, () => {
      console.log(`Server running at http://localhost:${port}`);
    });
