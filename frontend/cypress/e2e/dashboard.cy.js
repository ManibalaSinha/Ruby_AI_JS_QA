describe("Dashboard Page", () => {
  it("loads the dashboard", () => {
    cy.visit("/dashboard"); // goes to React page
    cy.contains("Test Results"); // checks heading
  });
});
