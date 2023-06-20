import React from "react";
import { Route, Switch } from "react-router-dom";
import SignupFormPage from "./components/SignupFormPage";
import Navigation from "./components/Navigation";
import RecipeBox from "./components/RecipeBox";
import EasyWeeknightDinners from "./components/EasyWeeknightDinners";

function App() {
  return (
    <>
      <Navigation />
        <Switch>
          <Route path="/recipebox">
            <RecipeBox />
          </Route>
          <Route path="/easyweeknightdinners">
            <EasyWeeknightDinners />
          </Route>
        </Switch>
    </>
  );
}

export default App;
