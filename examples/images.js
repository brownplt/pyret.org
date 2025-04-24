import { makeEmbed } from "/node_modules/pyret-embed/dist/pyret.js";

export async function images(iframeContainer) {
  const embed = await makeEmbed('images-example', iframeContainer, "/node_modules/pyret-embed/dist/build/web/editor.embed.html#footerStyle=hide&warnOnExit=false");

const example = `use context starter2024

treetop = triangle(60, "solid", "darkgreen")
trunk = square(20, "solid", "brown")
tree = above(treetop, trunk)

sky = rectangle(100, 50, "solid", "lightblue")
ground = rectangle(100, 50, "solid", "lightgreen")

background = above(sky, ground)

sun = circle(20, "solid", "yellow")

with-tree = put-image(tree, 30, 50, background)
scene = put-image(sun, 100, 100, with-tree)

forest = beside-list([list: tree, tree, tree, tree])
`;

  embed.sendReset({
    definitionsAtLastRun: example,
    interactionsSinceLastRun: ["scene", "forest"],
    editorContents: example,
    replContents: ""
  });
}