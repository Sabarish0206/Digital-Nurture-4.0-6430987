import React from 'react';

const offices = [
  {
    id: 1,
    name: "Workspace One",
    rent: 45000,
    address: "Anna Nagar, Chennai",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcP0ELQ8vfZQffJ_Ag-BcwA1gb6lykxKJfmA&s"
  },
  {
    id: 2,
    name: "Corporate Hub",
    rent: 75000,
    address: "MG Road, Bengaluru",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcP0ELQ8vfZQffJ_Ag-BcwA1gb6lykxKJfmA&s/"
  },
  {
    id: 3,
    name: "StartUp Den",
    rent: 60000,
    address: "T Nagar, Chennai",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcP0ELQ8vfZQffJ_Ag-BcwA1gb6lykxKJfmA&s"
  }
];

const OfficeList = () => {
  return (
    <div>
      <h2 style={{ textAlign: 'center' }}>Office Space at affordable range</h2>
      {offices.map((office) => (
        <div
          key={office.id}
          style={{
            border: "1px solid #ccc",
            borderRadius: "8px",
            margin: "15px auto",
            padding: "10px",
            width: "350px",
            height: "auto",
          }}
        >
          <img
            src={office.image}
            alt={office.name}
            style={{ width: "100%", height: "120px", borderRadius: "6px" }}
          />
          <h3>{office.name}</h3>
          <p>{office.address}</p>
          <p style={{ color: office.rent > 60000 ? "green" : "red" }}>
            ₹ {office.rent}
          </p>
        </div>
      ))}
    </div>
  );
};

export default OfficeList;
