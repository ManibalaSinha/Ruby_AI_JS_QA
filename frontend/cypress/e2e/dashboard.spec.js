describe('Dashboard', () => {
  it('loads test results table', () => {
    cy.visit('http://localhost:5173');
    cy.contains('QA Dashboard');
    cy.get('table').should('exist');
    cy.get('tbody tr').its('length').should('be.gte', 1);
  });
});
