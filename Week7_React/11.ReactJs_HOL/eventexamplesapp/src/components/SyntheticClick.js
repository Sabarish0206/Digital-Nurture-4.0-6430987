import React from 'react';

const SyntheticClick = () => {
  const handleClick = (event) => {
    alert("I was clicked (Synthetic Event)");
    console.log(event);
  };

  return (
    <div>
      <button onClick={handleClick}>Click Me</button>
    </div>
  );
};

export default SyntheticClick;
