func testSignIn() throws {
    // Set up your test environment
    let app = XCUIApplication()
    app.launch()

    // Perform the sign-in action
    // Replace this with your own sign-in logic
    Auth.auth().signIn(withEmail: "test@example.com", password: "password") { (result, error) in
        // Assert that the sign-in was successful
        XCTAssertNil(error, "Sign-in failed: \(error?.localizedDescription ?? "")")
        XCTAssertNotNil(result?.user, "User is nil after sign-in")

        // Add any additional assertions or actions you want to perform after sign-in

        // Take a screenshot if needed
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Sign-in Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}