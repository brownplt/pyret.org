const example = `use context starter2024

fun is-sorted-ascending(l :: List<Number>) -> Boolean:
  cases (List) l:
    | empty => true
    | link(f, r) =>
      cases (List) r:
        | empty => true
        | link(fr, rr) =>
          if f <= fr:
            is-sorted-ascending(r)
          else:
            false
          end
      end
  end
end

fun insert(n :: Number,
    l :: List%(is-sorted-ascending))
  -> List%(is-sorted-ascending):
  cases (List) l:
    | empty => [list: n]
    | link(f, r) =>
      if n < f: link(n, l)
      else:     link(f, insert(n, r))
      end
  end
end

check:
  insert(1, [list: 2, 3, 4]) is [list: 1, 2, 3, 4]
  insert(1, [list: 3, 2, 4]) raises "predicate"
end
`;

export const refinement = {
  definitionsAtLastRun: example,
  editorContents: example,
  replContents: ""
};
