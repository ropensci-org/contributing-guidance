Here we document design decisions for future reference

## Comments for later
- Comments are hidden in the Rmd docs with `<!--COMMENT: STEFFI says this -->`
- To find all remaining comments:
  - In RStudio use Edit > Find in Files > "COMMENT" (and check match case)


## Adding anchors (where we can link to)
- `### Section Heading {#my-anchor}`
- In text:
  ```
  <div id="my-anchor"></div>
  **Text**
  ```

Links look like `[My text](my-anchor)`

## Quoting people

```
> My awesome quote.
>
> [Awesome Name in Awesome Source or on Twitter](https://awesome.source) 
```