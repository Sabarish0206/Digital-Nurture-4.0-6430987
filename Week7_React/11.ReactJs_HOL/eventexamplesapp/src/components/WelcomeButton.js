import React from 'react';

const WelcomeButton = () => {
  const showMessage = (message) => {
    alert(message);
  };

  return (
    <div>
      <button onClick={() => showMessage("Welcome")}>Say Welcome</button>
    </div>
  );
};

export default WelcomeButton;
