import React, { useState } from 'react';
import GuestPage from './components/GuestPage.js';
import UserPage from './components/UserPage.js';

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleToggle = () => {
    setIsLoggedIn(prev => !prev);
  };

  return (
    <div className="App">
      <h1>Ticket Booking App</h1>
      <button onClick={handleToggle}>
        {isLoggedIn ? "Logout" : "Login"}
      </button>

      <hr />
      {isLoggedIn ? <UserPage /> : <GuestPage />}
    </div>
  );
}

export default App;
