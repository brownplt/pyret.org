const example = `use context starter2024

data Tree:
  | mt with: 
    method size(self): 0 end
  | node(v, l, r) with: 
    method size(self): 1 + self.l.size() + self.r.size() end
end

check:
  t = node(1, node(2, mt, mt), node(3, mt, node(4, mt, mt)))
  t.size() is 4
end`;

export const oop = {
    definitionsAtLastRun: example,
    interactionsSinceLastRun: [ ],
    editorContents: example,
    replContents: ""
}
