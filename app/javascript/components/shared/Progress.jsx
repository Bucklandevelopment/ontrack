import React from 'react'
import PropTypes from 'prop-types'

class Progress extends React.Component {
  renderData(value, idx) {
    return (
      <div className="progress" key={idx} style={{ width: `${value.percentage}%`, backgroundColor: value.color ? value.color : '#8f8f8f' }}>
      </div>
    );
  }

  render() {
    return (
      <div className={`progress-bar ${this.props.small ? 'progress-bar-sm' : ''}`}>
        {this.props.data.map((value, idx) => { return this.renderData(value, idx) })}
      </div>
    );
  }
}

Progress.defaultProps = {
  data: [],
  small: false
}

Progress.propTypes = {
  data: PropTypes.array,
  small: PropTypes.bool
}

export default Progress;
