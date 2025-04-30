const example = `use context starter2024

# A test fails! Is the test wrong or the code?
# Try fixing what's wrong and running again!
examples:
  positives([list: -3, 4, 7]) is [list: 4, 7]
  positives([list: 0, 5, -1]) is [list: 0, 5]
end
fun positives(nums):
  for filter(n from nums):
    n > 0
  end
end`;

export const testing = {
    definitionsAtLastRun: example,
    interactionsSinceLastRun: [],
    editorContents: example,
    replContents: ""
}
