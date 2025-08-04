import React, { useState } from 'react';
import BookDetails from './components/BookDetails';
import BlogDetails from './components/BlogDetails';
import CourseDetails from './components/CourseDetails';

function App() {
  const [selected, setSelected] = useState("books");

  const books = [
    { id: 1, title: "Clean Code", author: "Robert C. Martin" },
    { id: 2, title: "Eloquent JavaScript", author: "Marijn Haverbeke" }
  ];

  const blogs = [
    { id: 1, title: "React vs Angular", date: "2024-06-01" },
    { id: 2, title: "Why TypeScript?", date: "2024-07-10" }
  ];

  const courses = [
    { id: 1, name: "React Basics", duration: "4 weeks" },
    { id: 2, name: "Advanced JS", duration: "6 weeks" }
  ];

  return (
    <div className="App">
      <h1>Blogger App</h1>

      <div>
        <button onClick={() => setSelected("books")}>Books</button>
        <button onClick={() => setSelected("blogs")}>Blogs</button>
        <button onClick={() => setSelected("courses")}>Courses</button>
      </div>

      <hr />

      {/* 🔹 Conditional Rendering using IF-ELSE as a function */}
      {
        (() => {
          if (selected === "books") {
            return <BookDetails books={books} />;
          } else if (selected === "blogs") {
            return <BlogDetails blogs={blogs} />;
          } else if (selected === "courses") {
            return <CourseDetails courses={courses} />;
          } else {
            return <p>Please select a valid category.</p>;
          }
        })()
      }

      <hr />

      {/* 🔹 Conditional Rendering using Ternary Operator */}
      <div>
        <h3>Ternary Example</h3>
        {selected === "books" ? <p>Currently Viewing: Books</p> : null}
        {selected === "blogs" ? <p>Currently Viewing: Blogs</p> : null}
        {selected === "courses" ? <p>Currently Viewing: Courses</p> : null}
      </div>

      {/* 🔹 Conditional Rendering using Logical && */}
      <div>
        <h3>Logical && Example</h3>
        {selected === "books" && <p>Book list is shown above</p>}
        {selected === "blogs" && <p>Blog list is shown above</p>}
        {selected === "courses" && <p>Course list is shown above</p>}
      </div>
    </div>
  );
}

export default App;
