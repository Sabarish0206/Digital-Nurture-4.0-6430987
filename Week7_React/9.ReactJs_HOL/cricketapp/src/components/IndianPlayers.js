import React from 'react';

const IndianPlayers = () => {
  const T20players = ["Rohit", "Pant", "Bumrah"];
  const RanjiTrophy = ["Yashasvi", "Sarfaraz", "Mukesh"];

  const mergedPlayers = [...T20players, ...RanjiTrophy];

  const [p1, p2, p3, p4, p5, p6] = mergedPlayers;

  const evenPlayers = [p1, p3, p5];
  const oddPlayers = [p2, p4, p6];

  return (
    <div>
      <h2>Merged Players (T20 + Ranji):</h2>
      <p>{mergedPlayers.join(', ')}</p>

      <h3>Even Team Players (Destructured):</h3>
      <ul>
        {evenPlayers.map((player, index) => (
          <li key={index}>{player}</li>
        ))}
      </ul>

      <h3>Odd Team Players (Destructured):</h3>
      <ul>
        {oddPlayers.map((player, index) => (
          <li key={index}>{player}</li>
        ))}
      </ul>
    </div>
  );
};

export default IndianPlayers;
