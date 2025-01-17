import React, { useState } from 'react';
    import './index.css';

    function App() {
      const [question, setQuestion] = useState('');
      const [answer, setAnswer] = useState('');

      const handleQuestion = async (e) => {
        e.preventDefault();
        // Simulate PyTorch chatbot response
        const response = await fetch('/api/chat', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ question }),
        });
        const data = await response.json();
        setAnswer(data.answer);
      };

      return (
        <div className="App">
          <h1>Birthday Gift Advisor</h1>
          <form onSubmit={handleQuestion}>
            <input
              type="text"
              value={question}
              onChange={(e) => setQuestion(e.target.value)}
              placeholder="Ask a question..."
            />
            <button type="submit">Ask</button>
          </form>
          {answer && <p>Answer: {answer}</p>}
        </div>
      );
    }

    export default App;
