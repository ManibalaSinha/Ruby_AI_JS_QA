// tests/cypress/integration/ai_tests.spec.js
describe('Dashboard', () => {
  it('loads results', () => {
    cy.visit('http://localhost:3000');
    cy.get('.result').should('exist');
  });
});
