import React from 'react';
import ListofPlayers from './components/ListofPlayers.js';
import IndianPlayers from './components/IndianPlayers.js';

const App = () => {
  const [flag, setFlag] = React.useState(true); // Toggle to switch view

  const handleClick = () => {
    setFlag(!flag);
  };

  return (
    <div className="App">
      <h1>Cricket App</h1>
      <button onClick={handleClick}>
        Switch View (Current: {flag ? 'List of Players' : 'Indian Players'}) - Flag is {flag.toString()}
      </button>
      {flag ? <ListofPlayers /> : <IndianPlayers />}
    </div>
  );
};

export default App;
