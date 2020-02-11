class GithubClient
  def initialize
    @client = Graphlient::Client.new(
      'https://api.github.com/graphql',
      headers: {
        'Authorization' => "Bearer #{ENV['GITHUB_TOKEN']}"
      },
      http_options: {
        read_timeout: 20,
        write_timeout: 30
      }
    )
  end

  def repositories(search_query:, per_page: 10, cursor: nil)
    query = <<-GRAPHQL
    query($queryString: String!, $perPage: Int) {
      search(query: $queryString, type: REPOSITORY, first: $perPage) {
        repositoryCount
        edges {
          node {
            ... on Repository {
              name
              owner {
                login
              }
              description
              stargazers {
                totalCount
              }
              forks {
                totalCount
              }
              updatedAt
            }
          }
        }
      }
    }
    GRAPHQL
    results = @client.query query, { queryString: search_query, perPage: per_page }
    results.data.search.edges.map do |edge|
      node = edge.node
      {
        name: node.name,
        owner: node.owner.login,
        description: node.description,
        stars: node.stargazers.total_count,
        forks: node.forks.total_count
      }
    end
  end
end
