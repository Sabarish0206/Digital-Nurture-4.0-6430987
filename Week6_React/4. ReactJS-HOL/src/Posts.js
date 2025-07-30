import React from 'react';
import Post from './Post';
import './Posts.css'; 

class Posts extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: [],
      loading: true,
      error: null
    };
  }

  loadPosts() {
    fetch('https://jsonplaceholder.typicode.com/posts')
      .then(response => response.json())
      .then(data => {
        const postObjects = data.map(p => new Post(p.id, p.title, p.body));
        this.setState({ posts: postObjects, loading: false });
      })
      .catch(error => {
        this.setState({ error: 'Failed to load posts', loading: false });
      });
  }

  componentDidMount() {
    this.loadPosts();
  }

  componentDidCatch(error, info) {
    alert('An error occurred: ' + error);
  }

  render() {
    if (this.state.loading) {
      return <h2>Loading posts...</h2>;
    }

    if (this.state.error) {
      return <h2>{this.state.error}</h2>;
    }

    return (
      <div>
        <h1>Blog Posts</h1>
        {this.state.posts.map(post => (
          <div key={post.id} className="post">
            <h2>{post.title}</h2>
            <p>{post.body}</p>
          </div>
        ))}
      </div>
    );
  }
}

export default Posts;
