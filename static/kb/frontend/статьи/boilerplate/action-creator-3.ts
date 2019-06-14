/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*              TYPES                           */
/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
type Type = {
    readonly type: string;
}

type Payload<T> = {
    readonly payload: T;
}

type Action<T>  = Type & Payload<T>;

type ActionCreator<T> = {
    (payload: T): Action<T>;
};

// TypedActionCreator is not only the function which takes the payload, 
// it also has information about the Type of the action
type TypedActionCreator<T> = Type & ActionCreator<T>;
  