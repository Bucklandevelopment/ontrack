import React from 'react'
import ReactDOM from 'react-dom'
import InsightsMain from '../components/insights/Main'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <InsightsMain availableYears={window.InitialProps.availableYears} hasData={window.InitialProps.hasData} />,
    document.getElementById("insights"),
  )
})
