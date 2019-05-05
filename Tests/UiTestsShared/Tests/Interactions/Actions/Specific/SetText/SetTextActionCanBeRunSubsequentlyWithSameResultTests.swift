import MixboxUiTestsFoundation

// TODO: Test all options (function arguments)
// TODO: Code generation
final class SetTextActionCanBeRunSubsequentlyWithSameResultTests: BaseActionTestCase {
    func test_setText_withPasteInputMethod_canBeRunSubsequentlyWithSameResult_ISFLAKY() {
        checkTextActionCanBeRunSubsequentlyWithSameResult(
            inputMethod: .paste
        )
    }
    
    func test_setText_withTypeInputMethod_canBeRunSubsequentlyWithSameResult() {
        checkTextActionCanBeRunSubsequentlyWithSameResult(
            inputMethod: .type
        )
    }
    
    // TODO: Fix, pasting is flaky
    /*
    func test_setText_withPasteUsingPopupMenusInputMethod_canBeRunSubsequentlyWithSameResult() {
        checkTextActionCanBeRunSubsequentlyWithSameResult(
            inputMethod: .pasteUsingPopupMenus
        )
    }
    */
    
    // MARK: - Actual logic of tests
    
    private func checkTextActionCanBeRunSubsequentlyWithSameResult(
        inputMethod: SetTextActionFactory.InputMethod)
    {
        checkActionCanBeRunSubsequentlyWithSameResult(
            actionSpecification: ActionSpecifications.setText(
                text: "Text that is set",
                inputMethod: inputMethod
            ),
            resetViewsForCurrentActionSpecification: true
        )
    }
}
