class FinalizeOrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.finalize_order_mailer.finalize.subject
  #
  def finalize(cart)
    @mail_cart = cart

    mail to: @mail_cart.user.email,
         subject: "The Best Shop: Order confirmation!"
  end
end
