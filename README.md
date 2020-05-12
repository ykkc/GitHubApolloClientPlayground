# GitHubApolloClientPlayground

- Apollo iOS × SwiftUIでGitHub APIを叩いてみた

## Equipment to develop

- [Apollo CLI](https://www.npmjs.com/package/apollo)のインストール
```
npm install -g apollo
```

- GraphQLのschemaの取得
```
apollo schema:download --endpoint="https://api.github.com/graphql" --header "Authorization: Bearer <GitHub Token>"
```
（[Personal access tokens](https://github.com/settings/tokens)から事前にGitHub Tokenを作っておく）

- schemaとqueryからswiftファイルを自動生成する
```
apollo codegen:generate --localSchemaFile=schema.json --queries=GitHubApolloClientPlayground/Apollo/query.graphql --target=swift GitHubApolloClientPlayground/Apollo/API.swift
```

## Pods

- [Apollo iOS](https://github.com/apollographql/apollo-ios)