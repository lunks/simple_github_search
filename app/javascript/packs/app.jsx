import React from 'react'
import ReactDOM from 'react-dom'
import GithubSimpleSearch from "./github_simple_search"

const App = () => (
  <GithubSimpleSearch />
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.body.appendChild(document.createElement('div')),
  )
})
