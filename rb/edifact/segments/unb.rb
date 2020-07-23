class Segment
  def unb()
    sender_gln = @data[3]
    receiver_gln = @data[5]
    return {
      "sender_gln" => sender_gln,
      "receiver_gln" => receiver_gln
    }
  end
end