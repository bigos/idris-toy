module Main

record GlobalState where
  constructor MkGlobalState
  entered : String

initGlobalState : GlobalState
initGlobalState = MkGlobalState ""

prompt : String ->  IO String
prompt s = do
  putStrLn (s ++ " > ")
  getLine

mainLoop : GlobalState ->   IO ()
mainLoop globalState = do
  putStrLn "Global State"
  putStrLn (entered globalState)
  aaa <- prompt "Enter again"
  if aaa /= "quit"
  then mainLoop (MkGlobalState aaa)
  else putStrLn ""

main : IO ()
main = do
  putStrLn "Hi"
  zzz <- prompt "Please enter something"
  putStrLn ("you have entered " ++ zzz)
  mainLoop initGlobalState
  putStrLn "finished"
