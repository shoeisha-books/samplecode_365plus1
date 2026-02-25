const WIDTH = 8, HEIGHT = 8, GAP = 4
const COLOR = "\x1b[38;2;0;140;207m", RESET = "\x1b[0m"

const isFourPixel = (x: number, y: number) =>
    (y < 4 && x === Math.floor(HEIGHT / 2) - y) ||
    y === Math.floor(HEIGHT / 2) ||
    x === Math.floor(WIDTH / 2)

const isZeroPixel = (x: number, y: number) =>
    ((x === 0 || x === WIDTH - 2) && y > 0 && y < HEIGHT - 1) ||
    ((y === 0 || y === HEIGHT - 1) && x > 0 && x < WIDTH - 2)

const renderGlyph = (fn: (x: number, y: number) => boolean) =>
    Array.from({ length: HEIGHT }, (_, y) =>
    Array.from({ length: WIDTH }, (_, x) =>
        fn(x, y) ? `${COLOR}#${RESET}` : " "
    ).join("")
    )

const joinGraph = (glyphs: string[][]) =>
    glyphs.reduce((a, b) =>
    a.map((l, i) => l + " ".repeat(GAP) + b[i])
    )

const render = () => {
    const four = renderGlyph(isFourPixel), zero = renderGlyph(isZeroPixel)
    console.log(joinGraph([four, zero]).join("\n"))
}

render()