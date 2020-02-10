import React, { useState, useEffect } from 'react'

const GithubSimpleSearch = props => {
  const [search, setSearch] = useState("")

  useEffect(() => {
    if(!search) {
      return
    }
    console.log(search)
  }, [search])

  return (
    <div>
      <input type="text" value={search} onChange={e => setSearch(e.target.value)} />
    </div>
  )
}

export default GithubSimpleSearch
