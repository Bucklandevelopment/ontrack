import React from 'react'
import PropTypes from 'prop-types'
import { Numerics } from '../../helpers/main'
import Progress from '../shared/Progress'
import CategoryTile from './CategoryTile'

class Breakdown extends React.Component {
  renderCategory(category, idx) {
    return <CategoryTile key={idx} categoryWithExpensesAndSpend={category} />;
  }

  render() {
    return (
      <div>
        {this.props.categoriesWithExpensesAndSpend.map((value, idx) => { return this.renderCategory(value, idx) })}
        <div className="category-tile border-none">
          <div className="add">+ Add a category</div>
        </div>
      </div>
    );
  }
}

Breakdown.defaultProps = {
  categoriesWithExpensesAndSpend: []
}

Breakdown.propTypes = {
  categoriesWithExpensesAndSpend: PropTypes.array
}

export default Breakdown;
