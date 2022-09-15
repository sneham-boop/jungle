describe('Jungle App', () => {
  it('is able to visit the page', () => {
    cy.visit('/')
  });

  it("Can click on a product", () => {
    cy.get(".products article").should("have.length", 2);
    cy.get('.products article img').first().click()
  });
});