module Spree
  module Admin
    module PaymentsControllerDecorator
      def paypal_refund
        if request.get?
          if @payment.source.state == 'refunded'
            flash[:error] = I18n.t(:already_refunded, scope: 'spree.paypal')
            redirect_to admin_order_payment_path(@order, @payment)
          end
        elsif request.post?
          response = @payment.payment_method.refund(@payment, params[:refund_amount])
          if response.success?
            flash[:success] = I18n.t(:refund_successful, scope: 'spree.paypal')
            redirect_to admin_order_payments_path(@order)
          else
            flash.now[:error] = I18n.t(:refund_unsuccessful, scope: 'spree.paypal') + " (#{response.errors.first.long_message})"
            render
          end
        end
      end

      ::Spree::Admin::PaymentsController.prepend self
    end
  end
end
