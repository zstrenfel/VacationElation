import { combineReducers } from 'redux'
import { LOGIN_USER, SET_TRIP_PARAMS } from './actions'

//starting state
const initialState = {
  user: {},
  trip_params: {}
}

function user(state={}, action) {
  switch(action.type) {
    case LOGIN_USER:
      return Object.assign({}, state, {
        user: {
          email: action.user.email,
          loggedIn: true
        }
      })
      default:
        return state
  }
};

function trip(state={}, action) {
  switch(action.type) {
    case SET_TRIP_PARAMS: {
      return Object.assign, state, {
        trip_params: {
          startDate: action.params.startDate,
          endDate: action.params.endDate,
          maxPrice: action.params.maxPrice,
          keywords: action.params.keywords
        }
      }
    }
    default:
      return state;
  }
}

const reducers = combineReducers(user, trip)
export default reducers