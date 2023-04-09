class RotationalCipher
  LOWER = [*'a'..'z']
  UPPER = [*'A'..'Z']
  ALPHA = [*LOWER, *UPPER].join

  def self.rotate(message, rotations)
    message.tr(ALPHA, (LOWER.rotate(rotations) + UPPER.rotate(rotations)).join)
  end
end
