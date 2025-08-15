describe('AI Generated Tests', () => {
  it('should test login form', () => {
    cy.visit('https://example.com/login')
    cy.get('#username').type('testuser')
    cy.get('#password').type('password')
    cy.get('button[type=submit]').click()
    cy.url().should('include', '/dashboard')
  })
})
