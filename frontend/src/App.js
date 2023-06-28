import React from "react";
import { Route, Switch } from "react-router-dom";
import Navigation from "./components/Navigation";
import RecipeBox from "./components/RecipeBox";
import EasyWeeknightDinners from "./components/EasyWeeknightDinners";
import RecipeOfTheDay from "./components/RecipeOfTheDay";
import RecipeIndex from "./components/RecipeIndex";
import RecipeShow from "./components/RecipeShow";

function App() {
  return (
    <>
      <Navigation />
        <Switch>
          <Route exact path="/">
            <RecipeOfTheDay />
            <RecipeIndex />
          </Route>
          <Route exact path="/recipebox">
            <RecipeBox />
          </Route>
          <Route exact path="/recipes/:recipeId">
            <RecipeShow />
          </Route>
          <Route path="/easyweeknightdinners">
            <EasyWeeknightDinners />
          </Route>
        </Switch>
    </>
  );
}

export default App;
