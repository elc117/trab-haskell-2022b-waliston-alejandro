import math
import random
import cairo

color1 = [0, 255, 128, 255, 255, 0, 204, 51, 204, 153, 51, 250, 180, 20, 0]
color2 = [0, 0, 0, 153, 204, 51, 153, 102, 153, 51, 51, 150, 170, 180, 190, 250, 260]
color3 = [0, 0, 0, 0, 0, 0, 255, 255, 255, 0, 153, 15, 65, 48, 26, 150, 102, 202, 200, 300]

with cairo.SVGSurface("example.svg", 800, 800) as surface:
    f1 = cairo.Context(surface)
    f2 = cairo.Context(surface)
    f3 = cairo.Context(surface)
    f4 = cairo.Context(surface)
    f5 = cairo.Context(surface)
    f6 = cairo.Context(surface)
    f7 = cairo.Context(surface)
    f8 = cairo.Context(surface)


    # Sub-path 1
    f1.set_source_rgb(random.choice(color1), random.choice(color2), random.choice(color3))

    f1.rotate(31 * math.pi / 180)

    f1.scale(0.5, 0.5)
    f1.translate(202, 120)
    f1.move_to(170, 90)
    f1.line_to(400, 200)
    f1.line_to(150, 350)

    f1.fill()
    f1.close_path()

    # Sub-path 2
    f2.set_source_rgb(random.choice(color1), random.choice(color2), random.choice(color3))

    f2.rotate(31 * math.pi / 180)
    f2.scale(0.5, 0.5)
    f2.translate(500, -60)
    f2.move_to(170, 90)
    f2.line_to(400, 200)
    f2.line_to(150, 350)
    f2.fill()

    f2.close_path()

    # Sub-path 3
    f3.set_source_rgb(random.choice(color1), random.choice(color2), random.choice(color3))

    f3.rotate(31 * math.pi / 180)
    f3.scale(0.5, 0.5)
    f3.translate(800, -237)
    f3.move_to(170, 90)
    f3.line_to(400, 200)
    f3.line_to(150, 350)
    f3.fill()
    f3.close_path()

    # Sub-path 4
    f4.set_source_rgb(random.choice(color1), random.choice(color2), random.choice(color3))

    f4.rotate(-28 * math.pi / 180)
    f4.scale(0.5, 0.5)

    f4.translate(-100, 350)
    f4.move_to(175, 90)
    f4.line_to(400, 200)
    f4.line_to(180, 315)
    f4.fill()
    f4.close_path()

    # Sub-path 5
    f5.set_source_rgb(random.choice(color1), random.choice(color2), random.choice(color3))

    f5.rotate(-28 * math.pi / 180)
    f5.scale(0.5, 0.5)

    f5.translate(218, 500)
    f5.move_to(170, 90)
    f5.line_to(387, 210)
    f5.line_to(175, 325)
    f5.fill()
    f5.close_path()

    # Sub-path 6
    f6.set_source_rgb(random.choice(color1), random.choice(color2), random.choice(color3))

    f6.rotate(-28 * math.pi / 180)
    f6.scale(1, 1)

    f6.translate(-150, 270)
    f6.move_to(185, 100)
    f6.line_to(315, 170)
    f6.line_to(107, 440)
    f6.fill()
    f6.close_path()

    # Sub-path 7
    f7.set_source_rgb(random.choice(color1), random.choice(color2), random.choice(color3))

    f7.rotate(-28 * math.pi / 180)
    f7.scale(1, 1)

    f7.translate(-300, 185)
    f7.move_to(178, 100)
    f7.line_to(308, 170)
    f7.line_to(250, 515)
    f7.fill()
    f7.close_path()

    # Sub-path 8
    f8.set_source_rgb(random.choice(color1), random.choice(color2), random.choice(color3))

    f8.rotate(-29 * math.pi / 180)
    f8.scale(1, 1)

    f8.translate(-15, 350)
    f8.move_to(195, 110)
    f8.line_to(318, 180)
    f8.line_to(-25, 358)
    f8.fill()
    f8.close_path()

    f1.stroke()
    f1.stroke()
