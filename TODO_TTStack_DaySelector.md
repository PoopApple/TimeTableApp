# TODO: TTStack Day Selector and Dynamic Periods

- [ ] 1. Move all days' periods into `TTState`  
    - Add lists for each day: `monday`, `tuesday`, ..., `sunday`
    - Optionally, use a `List<List<Period>>` or `Map<int, List<Period>>` for easier access

- [ ] 2. Add an `int currentDay` field to `TTState`  
    - 0 = Monday, 1 = Tuesday, ..., 6 = Sunday
    - Add a `setCurrentDay(int day)` method that calls `notifyListeners()`

- [ ] 3. Add a getter in `TTState` for the current day's periods  
    - Example: `List<Period> get currentPeriods => ...`

- [ ] 4. Update `TTStack` to use `ttState.currentPeriods` instead of `week.monday`

- [ ] 5. Remove or refactor `PoopWeek` if no longer needed

- [ ] 6. Add a day selector UI (Row of buttons or Dropdown) above `TTStack` in the `TT` widget  
    - On button press, call `ttState.setCurrentDay(dayIndex)`

- [ ] 7. (Optional) Style the selected day button for better UX

- [ ] 8. Remove or refactor `ttState.addd()` test data logic

- [ ] 9. Test: Changing the day updates the periods shown in `TTStack`

---

**Tip:**  
Check this file before working on