---
title: MongoDB Cheat Sheet
description: Collection of MongoDB commands and operations.
---

# MongoDB Cheat Sheet

## Show All Databases

```javascript
show dbs
```

## Show Current Database

```javascript
db;
```

## Create Or Switch Database

```javascript
use acme
```

## Drop

```javascript
db.dropDatabase();
```

## Create Collection

```javascript
db.createCollection("posts");
```

## Show Collections

```javascript
show collections
```

## Insert Row

```javascript
db.posts.insert({
  title: "Post One",
  body: "Body of post one",
  category: "News",
  tags: ["news", "events"],
  user: {
    name: "John Doe",
    status: "author",
  },
  date: Date(),
});
```

## Insert Multiple Rows

```javascript
db.posts.insertMany([
  {
    title: "Post Two",
    body: "Body of post two",
    category: "Technology",
    date: Date(),
  },
  {
    title: "Post Three",
    body: "Body of post three",
    category: "News",
    date: Date(),
  },
  {
    title: "Post Four",
    body: "Body of post three",
    category: "Entertainment",
    date: Date(),
  },
]);
```

## Get All Rows

```javascript
db.posts.find();
```

## Get All Rows Formatted

```javascript
db.find().pretty();
```

## Find Rows

```javascript
db.posts.find({ category: "News" });
```

## Sort Rows

```javascript
# asc
db.posts.find().sort({ title: 1 }).pretty()
# desc
db.posts.find().sort({ title: -1 }).pretty()
```

## Count Rows

```javascript
db.posts.find().count();
db.posts.find({ category: "news" }).count();
```

## Limit Rows

```javascript
db.posts.find().limit(2).pretty();
```

## Chaining

```javascript
db.posts.find().limit(2).sort({ title: 1 }).pretty();
```

## Foreach

```javascript
db.posts.find().forEach(function (doc) {
  print("Blog Post: " + doc.title);
});
```

## Find One Row

```javascript
db.posts.findOne({ category: "News" });
```

## Find Specific Fields

```javascript
db.posts.find(
  { title: "Post One" },
  {
    title: 1,
    author: 1,
  }
);
```

## Update Row

```javascript
db.posts.update(
  { title: "Post Two" },
  {
    title: "Post Two",
    body: "New body for post 2",
    date: Date(),
  },
  {
    upsert: true,
  }
);
```

## Update Specific Field

```javascript
db.posts.update(
  { title: "Post Two" },
  {
    $set: {
      body: "Body for post 2",
      category: "Technology",
    },
  }
);
```

## Increment Field (\$inc)

```javascript
db.posts.update(
  { title: "Post Two" },
  {
    $inc: {
      likes: 5,
    },
  }
);
```

## Rename Field

```javascript
db.posts.update(
  { title: "Post Two" },
  {
    $rename: {
      likes: "views",
    },
  }
);
```

## Delete Row

```javascript
db.posts.remove({ title: "Post Four" });
```

## Sub-Documents

```javascript
db.posts.update(
  { title: "Post One" },
  {
    $set: {
      comments: [
        {
          body: "Comment One",
          user: "Mary Williams",
          date: Date(),
        },
        {
          body: "Comment Two",
          user: "Harry White",
          date: Date(),
        },
      ],
    },
  }
);
```

## Find By Element in Array (\$elemMatch)

```javascript
db.posts.find({
  comments: {
    $elemMatch: {
      user: "Mary Williams",
    },
  },
});
```

## Add Index

```javascript
db.posts.createIndex({ title: "text" });
```

## Text Search

```javascript
db.posts.find({
  $text: {
    $search: '"Post O"',
  },
});
```

## Greater & Less Than

```javascript
db.posts.find({ views: { $gt: 2 } });
db.posts.find({ views: { $gte: 7 } });
db.posts.find({ views: { $lt: 7 } });
db.posts.find({ views: { $lte: 7 } });
```
