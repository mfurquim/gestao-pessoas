module ExtraSkillsHelper
  def skill_level(level)
    ExtraSkill::LEVELS[level]
  end
  def selection_level
    ExtraSkill::LEVELS.zip(5.times)
  end
end
