import React, { Suspense } from "react";
import {Layout} from "./components/Layout";
import {Route, Routes} from "react-router";

import {DashboardPage} from "./pages/DashboardPage";

import NotFound from "./pages/NotFound.jsx";
import {EventsPage} from "./pages/EventsPage";

const App = () => {

  return (
      <Suspense fallback="loading">
          <Routes>
              <Route path='/' element={<Layout />}>
                  <Route index element={<DashboardPage />} />
                  <Route path="/events" element={<EventsPage />} />
              </Route>
              <Route path='*' element={<NotFound />} />
          </Routes>
       </Suspense>
  );
}

export default App;
