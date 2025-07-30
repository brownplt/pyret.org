const example = `use context starter2024

import shared-gdrive("TTT Helper (for Pyret home page)", "1KIysiRxphUAKIAXm08xENzubR_kq-Nss") as TTT

TTT.draw-board(TTT.board-blank)

X = TTT.X
O = TTT.O
Blank = TTT.Blank

board-xox =
  TTT.board(
    [array:
      [array: X, Blank, Blank],
      [array: Blank, O, Blank],
      [array: Blank, Blank, X]])

TTT.draw-board(board-xox)

# The following is *not* \`provide\`d, so this will produce an error:
# TTT.pos2icon
`;

export const modules = {
  definitionsAtLastRun: example,
  editorContents: example,
  replContents: ""
};
