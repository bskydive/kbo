/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*              TYPES                           */
/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

...

// A ActionCreator is a function that takes a payload and 
// creates a dispatchable Action from it  
type ActionCreator<T> = {
    (payload: T): Action<T>;
};

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