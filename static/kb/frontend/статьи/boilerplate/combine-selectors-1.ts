export const routeSelector = createFeatureSelector('router');
export const routeParamSelector = (paramName: string) => (router: any) => router.state && router.state.params[paramName];

export const usernameSelector = createSelector(
    routeSelector,
    routeParamSelector('username')
);