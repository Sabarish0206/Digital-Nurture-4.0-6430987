import React from 'react';

const BlogDetails = ({ blogs }) => {
  return (
    <div>
      <h2>Blog Details</h2>
      <ul>
        {blogs.map((blog, index) => (
          <li key={blog.id || index}>
            <strong>{blog.title}</strong> - {blog.date}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default BlogDetails;
