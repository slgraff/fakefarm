describe("Create a button", function() {
  it("Button has an id", function() {
    expect(btn.id).toBe('new_item');
  });

  it("has a name", function() {
    expect(btn.text_content).toBe('New Item')
  })
});

setTimeout(function () {
  let b = document.querySelector('body')
  debugger
  b.prepend(btn)
}, 0)
