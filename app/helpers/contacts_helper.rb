module ContactsHelper

def contact_progress
  @contacts = Contact.where(["user_id = ?", current_user.id])
  @progress = 0
    if @contacts.count >= 5
      @progress = 100
    elsif @contacts.count == 4
      @progress = 75
    elsif @contacts.count == 3
      @progress = 50
    elsif @contacts.count == 2
      @progress = 25
    end
    return @progress
  end

def profile_progress
     @complete = []
      @complete << current_user.legal_name if !current_user.legal_name.nil?
      @complete << current_user.nickname if !current_user.nickname.nil?
      @complete << current_user.nationality if !current_user.nationality.nil?
      @complete << current_user.pronouns if !current_user.pronouns.nil?
    if @complete.length == 4
      @progress = 100
    elsif @complete.length == 3
      @progress = 75
    elsif @complete.length == 2
      @progress = 50
    elsif @complete.length == 1
      @progress = 25
    end
    return @progress
  end

  # def ceremony_progress
  #   @ceremony = Ceremony.where(["user_id = ?", current_user.id])
  #   @complete = []
  #   @ceremony.each do |ceremony|
  #     @complete << ceremony.ceremony_type if !ceremony.ceremony_type.nil?
  #     @complete << ceremony.burial_type if !ceremony.burial_type.nil?
  #     @complete << ceremony.details if !ceremony.details.nil?
  #     @complete << ceremony.epitaph if !ceremony.epitaph.nil?
  #     @complete << ceremony.press_release if !ceremony.press_release.nil?
  #   end
  #   if @complete.length == 5
  #     @progress = 100
  #   elsif @complete.length == 3 || @complete.length == 4
  #     @progress = 75
  #   elsif @complete.length == 2
  #     @progress = 50
  #   elsif @complete.length == 1 || @complete.length == 0
  #     @progress = 25
  #   end
  #   return @progress
  # end

end
