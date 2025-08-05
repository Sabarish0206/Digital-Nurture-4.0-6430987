import React, { useContext } from 'react';
import ThemeContext from './ThemeContext';

const EmployeeCard = ({ name, role }) => {
  const theme = useContext(ThemeContext);

  const buttonStyle = {
    backgroundColor: theme === 'dark' ? '#333' : '#eee',
    color: theme === 'dark' ? '#fff' : '#000',
    padding: '8px 12px',
    borderRadius: '4px',
    marginTop: '8px'
  };

  return (
    <div style={{ margin: '10px 0' }}>
      <p><strong>{name}</strong> – {role}</p>
      <button style={buttonStyle}>Contact</button>
    </div>
  );
};

export default EmployeeCard;
