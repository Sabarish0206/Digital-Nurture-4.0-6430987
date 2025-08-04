import React from 'react';
import Counter from './components/Counter';
import WelcomeButton from './components/WelcomeButton';
import SyntheticClick from './components/SyntheticClick';
import CurrencyConverter from './components/CurrencyConverter';

function App() {
  return (
    <div className="App">
      <h1>Event Examples App</h1>
      <Counter />
      <WelcomeButton />
      <SyntheticClick />
      <CurrencyConverter />
    </div>
  );
}

export default App;
