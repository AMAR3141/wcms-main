import Home from "./pages/home/Home";
import LoginPage from "./pages/login/LoginPage";
=======
>>>>>>> 3efe420e1081a52f4950775a878f9d3ef2377d63
import List from "./pages/list/List";
import Single from "./pages/single/Single";
import New from "./pages/new/New";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { productInputs, userInputs } from "./formSource";
import { QueryClientProvider,QueryClient} from "react-query";
<<<<<<< HEAD
import ListProducts from "./pages/listProducts/ListProducts";
import NewProduct from "./pages/newProduct/NewProduct";
import Cookies from "js-cookie";
import { useNavigate } from "react-router-dom";
=======


>>>>>>> 3efe420e1081a52f4950775a878f9d3ef2377d63


const queryClient=new QueryClient()
function App() {
<<<<<<< HEAD
  
  const { darkMode } = useContext(DarkModeContext);
=======

  
>>>>>>> 3efe420e1081a52f4950775a878f9d3ef2377d63
  

  return (
    <QueryClientProvider client={queryClient}>
    <div>
      <BrowserRouter>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route path="/">
            <Route index element={<Home />} />
<<<<<<< HEAD
=======
            {/* <Route path="login" element={<Login />} /> */}
>>>>>>> 3efe420e1081a52f4950775a878f9d3ef2377d63
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
