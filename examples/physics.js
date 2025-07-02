const example = `use context starter2024

ball = circle(20, "solid", "red")
background = rectangle(50, 200, "outline", "black")

type State = { v :: Number, height :: Number }

G = -0.98

fun next-state(current):
  # fill in ... with current.v to change the height on each tick!
  { v: current.v + G, height: current.height + ... }
end
fun draw-state(current):
  put-image(ball, 25, current.height, background)
end

sim = reactor:
  init: { v : 0, height : 150 },
  seconds-per-tick: 0.1,
  on-tick: next-state,
  to-draw: draw-state
end
sim.interact-trace()
`;

export const physics = {
    definitionsAtLastRun: false,
    interactionsSinceLastRun: [],
    editorContents: example,
    replContents: "# Click Run above! There will be an error you can fix."
}
