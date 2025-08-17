describe('Test Results Dashboard', () => {
  // Story: As a QA Engineer, I want to load the dashboard and see results from backend.
  
  it('loads the dashboard page', () => {
    cy.visit('http://localhost:5173'); // frontend dev server
    cy.contains('QA Dashboard');       // make sure page header is visible
  });

  it('fetches test results from backend API', () => {
    // Story: API integration test → frontend calls backend, data is shown
    cy.intercept('GET', '**/test_results').as('getResults');

    cy.visit('http://localhost:5173');
    cy.wait('@getResults').its('response.statusCode').should('eq', 200);

    cy.get('[data-testid="result-item"]').should('have.length.greaterThan', 0);
  });

  it('creates a new test result', () => {
    // Story: QA simulates adding a new test result
    const newResult = { status: 'passed', details: 'Frontend E2E check' };

    cy.intercept('POST', '**/test_results').as('createResult');

    cy.request('POST', 'http://localhost:3000/test_results', newResult)
      .its('status')
      .should('eq', 201);
  });
});
