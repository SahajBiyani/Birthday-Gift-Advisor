const express = require('express');
    const bodyParser = require('body-parser');
    const { execSync } = require('child_process');

    const app = express();
    const port = 3000;

    app.use(bodyParser.json());

    app.post('/api/recommend', (req, res) => {
      const { industry, relationship, income, budget, percentage } = req.body;
      const command = `swipl -s prolog/gift_advisor.pl -g "industry(john, ${industry}), relationship(john, mary, ${relationship}), budget(john, ${budget}), income(john, ${income}), percentage(john, ${percentage}), recommend_gift(john, Gift), writeln(Gift), halt." -t halt`;
      const output = execSync(command).toString().trim();
      res.json({ gift: output });
    });

    app.listen(port, () => {
      console.log(`Server running at http://localhost:${port}`);
    });
) => {
      console.log(`Server running at http://localhost:${port}`);
    });
