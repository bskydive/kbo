/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*              FACTORY FUNCTIONS               */
/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
function createType(type: string): Type {
    return { type };
}

function createPayload<T>(payload: T): Payload<T> {
    return { payload };
}

function createAction<T>(type: Type, payload: Payload<T>): Action<T> {
    return { 
        type: type.type,
        payload: payload.payload
    };
}

function createActionCreator<T>(type: Type): ActionCreator<T> {
    return (payload: T) => createAction(type, createPayload(payload));  
}

// binding the action creator to a dispatch function - hiding the dispatch call
function createBoundActionCreator<T>(actionCreator: ActionCreator<T>, dispatchFn: (action: Action<T>) => void): BoundActionCreator<T> {
    return (payload: T) => {
        const action = actionCreator(payload);
        dispatchFn(action);   
    };
}