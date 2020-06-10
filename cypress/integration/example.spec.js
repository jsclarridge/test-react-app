describe('The Home Page', () => {
  it('successfully loads', () => {
    cy.visit('/') // change URL to match your dev URL
  })
})

describe('Nonexistent page', () => {
  it('successfully loads', () => {
    cy.visit('/foo') // change URL to match your dev URL
  })
})
