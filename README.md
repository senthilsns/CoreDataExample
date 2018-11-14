# CoreDataExample

Platform : XCode 10.1 
Language: Swift 4.2


Action:

1. Save

      
      a. Refer to persistentContainer from appdelegate
      
      b. Create the context from persistentContainer
      
      c. Create an entity with UserDetail
      
      d. Create new record with this User Entity
      
      e. Set values for the records for each key
      
      
2. Fetch

      a. Prepare the request of type NSFetchRequest for the entity (UserDetail)
      
      b. If required use predicate for filter data
      
      c. Fetch the result from context in the form of array of [NSManagedObject]
      
      d. Iterate through an array to get value for the specific key
      
3. Delete

      a. Prepare the request with predicate for the entity (UserDetail in our example)
      
      b. Fetch record and which we want to delete
      
      c. And make context.delete(object) call 
