import React from 'react';

const UserPage = () => {
  return (
    <div>
      <h2>Welcome, User!</h2>
      <p>You are logged in. You can now book tickets.</p>
      <ul>
        <li>Flight A – 6:00 AM – ₹4500</li>
        <li>Flight B – 10:30 AM – ₹5200</li>
        <li>Flight C – 5:00 PM – ₹6000</li>
      </ul>
      <button>Book Flight A</button>
      <button>Book Flight B</button>
      <button>Book Flight C</button>
    </div>
  );
};

export default UserPage;
