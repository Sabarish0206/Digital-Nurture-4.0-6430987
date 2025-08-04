import React from 'react';

const ListofPlayers = () => {
  const players = [
    { name: "Virat Kohli", score: 90 },
    { name: "Rohit Sharma", score: 40 },
    { name: "MS Dhoni", score: 85 },
    { name: "Rishabh Pant", score: 30 },
    { name: "Jasprit Bumrah", score: 99 },
    { name: "Ravindra Jadeja", score: 70 },
    { name: "R. Ashwin", score: 45 },
    { name: "KL Rahul", score: 60 },
    { name: "Shubman Gill", score: 55 },
    { name: "Mohammed Siraj", score: 76 },
    { name: "Mohammed Shami", score: 80 }
  ];

  const below70Players = players.filter(player => player.score < 70); // using arrow function

  return (
    <div>
      <h2>All Players (using map):</h2>
      <ul>
        {players.map((player, index) => (
          <li key={index}>{player.name} - {player.score}</li>
        ))}
      </ul>

      <h3>Players with Score below 70 (using arrow function):</h3>
      <ul>
        {below70Players.map((player, index) => (
          <li key={index}>{player.name} - {player.score}</li>
        ))}
      </ul>
    </div>
  );
};

export default ListofPlayers;
