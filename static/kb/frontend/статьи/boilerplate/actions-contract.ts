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
