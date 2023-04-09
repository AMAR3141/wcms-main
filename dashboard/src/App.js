import Home from "./pages/home/Home";
import LoginPage from "./pages/login/LoginPage";
import List from "./pages/list/List";
import Single from "./pages/single/Single";
import New from "./pages/new/New";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { productInputs, userInputs } from "./formSource";
import { QueryClientProvider,QueryClient} from "react-query";



const queryClient=new QueryClient()
function App() 

  
  
{
  return (
    <QueryClientProvider client={queryClient}>
    <div>
      <BrowserRouter>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route path="/">
            <Route index element={<Home />} />
            
            <Route path="users">
              <Route index element={<List />} />
              <Route path=":userId" element={<Single />} />
              <Route
                path="new"
                element={<New inputs={userInputs} title="Add New User" />}
              />
            </Route>
          </Route>
        </Routes>
      </BrowserRouter>
    </div>
   </QueryClientProvider>
  );
  }

export default App;
