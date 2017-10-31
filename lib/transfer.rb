class Transfer
  # your code here
  attr_reader
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      self.sender -= self.amount
      self.receiver += self.amount
      self.status = "completed"
    end
  end

  def reverse_transaction
    if self.valid? && self.status == "complete"
      self.sender += self.amount
      self.receiver -= self.amount
      self.status = "reversed"
    end
  end
end
