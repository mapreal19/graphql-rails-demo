import React, { Component } from 'react';
import ApolloClient from 'apollo-boost';
import gql from 'graphql-tag';

import './App.css';

const client = new ApolloClient({
  uri: 'http://localhost:3000/graphql'
});


class App extends Component {
  state = {
    movies: [],
  };

  componentDidMount = () => {
    client.query({
      query: gql`
        query Movies {
          movies {
            id
            title
          }
        }
      `,
    }).then(response => {
      this.setState({
        movies: response.data.movies,
      })
    });
  };

  render() {
    return (
      <div className="App">
        <ul className="movies">
          {
            this.state.movies.map(movie =>
              <li>
                {movie.title}
              </li>
            )
          }
        </ul>
      </div>
    );
  }
}

export default App;
