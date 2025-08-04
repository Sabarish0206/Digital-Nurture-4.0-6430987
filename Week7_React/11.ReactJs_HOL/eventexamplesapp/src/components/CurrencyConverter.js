import React, { useState } from 'react';

const CurrencyConverter = () => {
  const [rupees, setRupees] = useState('');
  const [euro, setEuro] = useState(null);

  const handleSubmit = (e) => {
    e.preventDefault();
    const converted = parseFloat(rupees) / 101; // 1 Euro = ~101 INR
    setEuro(converted.toFixed(2));
    alert(`₹ ${rupees} is equivalent to € ${converted}`);
  };

  return (
    <div>
      <h2>Currency Converter</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="number"
          value={rupees}
          placeholder="Enter INR"
          onChange={(e) => setRupees(e.target.value)}
        />
        <button type="submit">Convert</button>
      </form>
    </div>
  );
};

export default CurrencyConverter;
