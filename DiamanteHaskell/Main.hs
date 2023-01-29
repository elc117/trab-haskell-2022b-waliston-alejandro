import Text.Printf
import System.Random

largura:: Int
largura = 500

altura:: Int
altura = 500

bordayh:: Int -> Int
bordayh alt = 3 * (div alt 10)

bordayv:: Int -> Int
bordayv alt = 2 * (div alt 10)

bordax:: Int -> Int
bordax larg = 2 * (div larg 10)

-- String inicial do SVG
svgBegin :: Int -> Int -> String
svgBegin w h = printf "<svg width='%d' height='%d' xmlns='http://www.w3.org/2000/svg'>\n" w h

-- String fundo preto
fundo :: Int -> Int -> String
fundo x y = printf "<rect x='0' y='0' width='%d' height='%d' style='black' />\n" x y

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

ciclo1:: [Int]
ciclo1 = take 9 (cycle [bordayh altura, bordayv altura])

ciclo2:: [Int]
ciclo2 = take 9 (cycle [bordayv altura, bordayh altura])

coordenadas1:: [(Int,Int)]
coordenadas1 = zip [bordax largura,(bordax largura + 60)..(bordax largura + 120)] [bordayh altura, bordayh altura, bordayh altura]

coordenadas2:: [(Int,Int)]
coordenadas2 = zip [(bordax largura + 150), (bordax largura + 150), (bordax largura + 150)] [altura - bordayv altura, altura - bordayv altura, altura - bordayv altura]

coordenadas3:: [(Int,Int)]
coordenadas3 = zip [(bordax largura + 300), (bordax largura + 240)..(bordax largura + 180)] [bordayh altura, bordayh altura, bordayh altura]

coordenadas4:: [(Int,Int)]
coordenadas4 = zip [bordax largura, (bordax largura + 30)..(bordax largura + 240)] ciclo1

coordenadas5:: [(Int,Int)]
coordenadas5 = zip [(bordax largura + 30), (bordax largura + 60)..(bordax largura + 270)] ciclo2

coordenadas6:: [(Int,Int)]
coordenadas6 = zip [(bordax largura + 60), (bordax largura + 90)..(bordax largura + 300)] ciclo1

svgPolygon :: (Int, Int, Int, Int, Int, Int, String) -> String
svgPolygon (x1, y1, x2, y2, x3, y3, fill) = printf "<polygon points='%d,%d %d,%d %d,%d' style='fill:%s;stroke:white;stroke-width:5'/>\n" x1 y1 x2 y2 x3 y3 fill 

aleatrgb :: StdGen -> Int -> [(Int,Int,Int)]
aleatrgb gen n = 
  let allrandoms = take (3*n) (randomRs (0, 255) gen::[Int])
      rs = take n allrandoms
      gs = slice n (2*n-1) allrandoms
      bs = slice (2*n) (3*n) allrandoms
      in zipWith3 (\r g b -> (r,g,b)) rs gs bs

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

rgbcode :: (Int,Int,Int) -> String
rgbcode (r,g,b)  = "rgb(" ++ show r  ++ ","  ++ show g ++ "," ++ show b ++ ")"

color :: StdGen -> [String]
color color_randgen = map rgbcode (aleatrgb color_randgen 20)

compacta :: (Int, Int) -> (Int, Int) -> (Int, Int) -> (Int, Int, Int, Int, Int, Int)
compacta (x1, y1) (x2, y2) (x3, y3) = (x1, y1, x2, y2, x3, y3)

compacta2 :: (Int, Int, Int, Int, Int, Int) -> String -> (Int, Int, Int, Int, Int, Int, String)
compacta2 (x1, y1, x2, y2, x3, y3) style = (x1, y1, x2, y2, x3, y3, style)

dados1:: StdGen -> [(Int, Int, Int, Int, Int, Int, String)]
dados1 color_randgen = zipWith compacta2 (zipWith3 compacta coordenadas1 coordenadas2 coordenadas3) (color color_randgen)

dados2:: StdGen -> [(Int, Int, Int, Int, Int, Int, String)]
dados2 color_randgen = zipWith compacta2 (zipWith3 compacta coordenadas4 coordenadas5 coordenadas6) (color color_randgen)

concatena:: String -> String -> String
concatena x y = x ++ y

svgIni :: String
svgIni =
  svgBegin largura altura ++
  fundo largura altura
 
main :: IO ()
main = do
  color_randgen <- newStdGen
  color_randgen2 <- newStdGen
  let des1 = foldl1 concatena (map svgPolygon (dados1 color_randgen))
  let des2 = foldl1 concatena (map svgPolygon (dados2 color_randgen2))
  let diamante = svgIni ++ des1 ++ des2 ++ svgEnd
  writeFile "output.svg" diamante