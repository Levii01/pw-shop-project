# Preview all emails at http://localhost:3000/rails/mailers/finalize_order_mailer
class FinalizeOrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/finalize_order_mailer/finalize
  def finalize
    FinalizeOrderMailer.finalize(Cart.where.not(balance: nil).first)
  end
end
