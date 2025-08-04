import React from 'react';

const GuestPage = () => {
  return (
    <div>
      <h2>Welcome, Guest!</h2>
      <p>Please browse the available flights below. Login to book tickets.</p>
      <ul>
        <li>Flight A – 6:00 AM – ₹4500</li>
        <li>Flight B – 10:30 AM – ₹5200</li>
        <li>Flight C – 5:00 PM – ₹6000</li>
      </ul>
    </div>
  );
};

export default GuestPage;
