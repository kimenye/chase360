# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  message    :text
#  lead_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require "test_helper"

class NoteTest < ActiveSupport::TestCase

  def note
    @note ||= Note.new
  end

  def test_valid
    assert note.valid?
  end

end
