class User
  attr :gender, :orientation

  LOGIC = {
      straight: { opposite: [:straight, :bi], same: [] },
      gay: { opposite: [], same: [:gay, :bi] },
      bi: { opposite: [:bi, :straight], same: [:gay, :bi] }
  }

  def initialize(gender, orientation)
    @gender = gender
    @orientation = orientation
  end

  def self.match_them(user1, user2)
    g_match = gender_match(user1, user2)
    rules = LOGIC[user1.orientation]
    rules[g_match].include?(user2.orientation)
  end

  def kind
    "#{orientation.capitalize} #{gender.capitalize}"
  end

  def self.gender_match(user1, user2)
    user1.gender == user2.gender ? :same : :opposite
  end

  def self.print_matches
    @straight_guy = User.new(:male,:straight)
    @straight_girl = User.new(:female,:straight)
    @bi_guy = User.new(:male, :bi)
    @bi_girl = User.new(:female, :bi)
    @gay_guy = User.new(:male,:gay)
    @gay_girl = User.new(:female,:gay)

    @users = [@straight_guy, @straight_girl, @bi_guy, @bi_girl, @gay_guy, @gay_girl]

    @users.each do |user|
      puts "#{user.kind} with #{user.kind} : #{match_them(user, user)}"
    end

    @users.combination(2).each do |user1, user2|
      puts "#{user1.kind} with #{user2.kind} : #{match_them(user1, user2)}"
    end
  end
end

User.print_matches
