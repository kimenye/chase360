require "test_helper"

class NoteTest < ActiveSupport::TestCase

  def note
    @note ||= Note.new
  end

  def test_valid
    assert note.valid?
  end

end
