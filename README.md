# batching
Adds in_batches to enumerable objects

**requirement**: enumerable objects must have the each\_with\_index method

Example:

```
ids = get_all_ids()

# adds the in_batches method to this object
ids.extend(Batching)

# use the in_batches method to fetch 100 ids at a time
ids.in_batches(batch_size: 100) do |batch|
  response = bulk_lookup(batch)

  JSON.parse(response.body).each do |result|
    # now process each result
  end
end
```
