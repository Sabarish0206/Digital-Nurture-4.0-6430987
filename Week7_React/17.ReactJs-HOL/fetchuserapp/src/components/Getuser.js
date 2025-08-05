import React, { useEffect, useState } from 'react';

const Getuser = () => {
  const [user, setUser] = useState(null);

  useEffect(() => {
    fetch("https://api.randomuser.me/")
      .then(response => response.json())
      .then(data => {
        const person = data.results[0];
        setUser({
          title: person.name.title,
          firstname: person.name.first,
          image: person.picture.large
        });
      })
      .catch(err => {
        console.error("Error fetching user:", err);
      });
  }, []);

  return (
    <div>
      <h2>Random User Info</h2>
      {user ? (
        <div>
          <img src={user.image} alt="User" style={{ borderRadius: '50%' }} />
          <p>
            <strong>{user.title} {user.firstname}</strong>
          </p>
        </div>
      ) : (
        <p>Loading user data...</p>
      )}
    </div>
  );
};

export default Getuser;
