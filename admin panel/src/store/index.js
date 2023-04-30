import {configureStore} from "@reduxjs/toolkit";
import {parentCategoriesApi} from "./slices/parentCategoriesApi.js";

export default configureStore({
    reducer: {
        [parentCategoriesApi.reducerPath] : parentCategoriesApi.reducer,
    },
    middleware: (getDefaultMiddleware) => getDefaultMiddleware().concat(parentCategoriesApi.middleware)
})