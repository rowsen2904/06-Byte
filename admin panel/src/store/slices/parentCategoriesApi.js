import {createApi, fetchBaseQuery} from "@reduxjs/toolkit/query/react";
import { api } from "../../constants/api";

export const parentCategoriesApi = createApi({
    reducerPath: 'parentCategoriesApi',
    mode: "no-cors",
    baseQuery: fetchBaseQuery({
        baseUrl: `${api}/`,
        mode: "cors"
    }),
    endpoints: (build) => ({
        getParentCategories: build.query({
           query: () => 'parent_categories'
        }),
        addParentCategories: build.mutation({
            query: (body) => ({
                url: 'parent_categories',
                method: 'POST',
                body
            })
        })
    })
});

export const {useGetParentCategoriesQuery, useAddParentCategoriesMutation} = parentCategoriesApi;