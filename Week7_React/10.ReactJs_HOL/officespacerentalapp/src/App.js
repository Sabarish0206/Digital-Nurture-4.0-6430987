import React from 'react';
import OfficeList from './components/OfficeList.js';

function App() {
  const heading = React.createElement('h1', {}, 'Office Space Rental App');

  return (
    <div className="App">
      {heading}
      <OfficeList />
    </div>
  );
}

export default App;
