import io from 'socket.io-client'

const Events = {
  MATCH_JOIN: 'match:join',
}

export class MatchService {
  constructor() {
    // TODO: change this URL
    this.socket = io('ws://localhost:4000')
  }

  joinMatch(team) {
    return new Promise((resolve, reject) => {
      this.socket.emit(Events.MATCH_JOIN, team, (err) => {
        return err ? reject(err) : resolve()
      })
    })
  }
}
