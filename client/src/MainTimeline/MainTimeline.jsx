import React, { Component } from 'react';
import './MainTimeline.css';


class MainTimeline extends Component {
  render() {

    let { timeline } = this.props.state.reducer;

    return (
      <div className="MTL">
        <h1 className="App-title">Daily Timeline</h1>
        <div className="App-top-gap">
        </div>

        {timeline
          ?
          timeline.map((entry) => (
              <div className="MTL-day">
                <h2 className="MTL-date">{entry.inserted_at}</h2>
                <div className="MTL-characters">
                  {entry.characters.map((character) => (
                    <div className="MTL-character">
                      <h3 className="MTL-character-display_name">
                        {character.display_name}
                      </h3>
                    </div>
                    )
                  )
                  }
                </div>
              </div> // MTL-day
            )
          )
        :
          <div className="MTL-day">
            No day recorded.
          </div>
        }
      </div> // MTL
    );
  }
}

export default MainTimeline;
