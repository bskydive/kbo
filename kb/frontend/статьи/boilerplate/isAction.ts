function isAction<T>(action: Action<any>, ...expectedActionCreators: TypedActionCreator<T>[]): action is Action<T> {
    return expectedActionCreators.some(expectedAction => expectedAction.type === action.type);
}