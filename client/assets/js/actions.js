// action types

export const LOGIN_USER = 'LOGIN_USER'
// export const SIGNUP_USER = 'SIGNUP_USER'
export const SET_TRIP_PARAMS = 'SET_TRIP_PARAMS'

//action creators

export function loginUser(user) {
  return {type: LOGIN_USER, user}
}

// export function signUpUser(user) {
//   return {type: SIGNUP_USER, user}
// }

export function setTripParams(params) {
  return {type: SET_TRIP_PARAMS, params}
}