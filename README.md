# GraphQL API Documentation

You can test it in the next link in graphql playground:
```
https://synonyms-api-challenge.onrender.com/graphiql
```

## Mutations

### `ReviewWord`

Review and perform operations on a word.( If you delete a word, its synonyms are also deleted)

```graphql
mutation {
  reviewWord(input: { word: "example", operation: AUTHORIZE }) {
    word {
      str
      authorization
    }
    errors
  }
}
```

Input:
- word (String, required): The word to be reviewed.
- operation (ReviewOperationEnum, required): The operation to perform (AUTHORIZE or DELETE).

Output:
- word (WordType, nullable): The reviewed word details.
  - str (String): The word string.
  - authorization (String): The authorization status.
- errors ([String], nullable): List of errors if any.

Authorization Header:
- Authorization: Bearer <admin_token>


### `ReviewSynonym `

Review and perform operations on a synonym.
```graphql
mutation {
  mutation {
  reviewSynonym(input: { synonym: "similar", operation: AUTHORIZE }) {
    synonym {
      synonym
      authorization
    }
    errors
  }
}
```

Input:
- synonym (String, required): The synonym to be reviewed.
- operation (ReviewOperationEnum, required): The operation to perform (AUTHORIZE or DELETE).

Output:
- synonym (SynonymType, nullable): The reviewed synonym details.
  - synonym (String): The synonym string.
  - authorization (String): The authorization status.
- errors ([String], nullable): List of errors if any.

Authorization Header:
- Authorization: Bearer <admin_token>


### `AddSynonym `

Add a synonym to a word.
```graphql
mutation {
  addSynonym(input: { word: "example", synonym: "similar" }) {
    result
  }
}
```

Input:
- word (String, required): The word to which the synonym will be added.
- synonym (String, required): The synonym to be added.
- 
Output:
- result (String, non-nullable): The result of the operation.


### `AdminLogin `

Authenticate an admin user.
```graphql
mutation {
  adminLogin(user: "admin_user", password: "admin_password") {
    token
    errors
  }
}
```

Input:
- user (String, required): The admin username.
- password (String, required): The admin password.
- 
Output:
- token (String, nullable): The authentication token.
- errors ([String], non-nullable): List of errors if authentication fails.


## Mutations

### `Word `

Fetch details of a word by its string.
```graphql
query {
  word(str: "example") {
    str
    authorization
    synonyms {
      synonym
      authorization
    }
  }
}
```

Input:
- str (String, required): The string of the word to fetch.

Output:
- str (String, nullable): The word string.
- authorization (String): The authorization status
- synonyms ([SynonymType], nullable): List of synonyms for the word.
  - synonym (String): The synonym string.
   - authorization (String): The authorization status
   
Authorization Header:
- Authorization: Bearer <admin_token> ( It will return any word doesn't matter if it is not authorized)
