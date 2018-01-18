
if in_spec?
  describe("assert_raises") {
    it "exists 0 when error is captured" do
      result = run("assert_raises captures errors")
      assert result.exit_code == 0
    end # === it "exists 0 when errors is captured"

    it "exists 0 when error pattern matches" do
      result = run("assert_raises compares pattern message")
      assert result.exit_code == 0
    end # === it

    it "exists 0 when error string matches" do
      result = run("assert_raises compares string message")
      assert result.exit_code == 0
    end # === it

    it "exists 1 when class mismatch" do
      result = run("assert_raises class mismatch")
      assert result.exit_code == 1
    end # === it "exists 1 when error is class mismatch

    it "exists 1 when error message does not match string" do
      result = run("assert_raises message string mismatch")
      assert result.exit_code == 1
    end # === it "exists 1 when error message does not match string"
  }
else
  describe "assert_raises" do
    it "captures errors" do
      assert_raises(IndexError) {
        a = [1]
        a.pop
        a.pop
      }
    end # === it "captures errors"

    it "compares pattern message" do
      assert_raises(IndexError, /Index out of bounds/) {
        a = [] of Int32
        a.pop
      }
    end # === it "compares pattern message"

    it "compares string message" do
      assert_raises(IndexError, "Index out of bounds") {
        a = [] of Int32
        a.pop
      }
    end # === it "compares string message"

    it "class mismatch" do
      assert_raises(ArgumentError) {
        a = [1]
        a.pop
        a.pop
      }
    end # === it "class mismatch"

    it "message string mismatch" do
      assert_raises(IndexError, "random") {
        a = [] of Int32
        a.pop
      }
    end # === it "message string mismatch"

    it "message pattern mismatch" do
      assert_raises(IndexError, /random/) {
        a = [] of Int32
        a.pop
      }
    end # === it "message pattern mismatch"

  end # === desc "assert_raises"
end # === if
