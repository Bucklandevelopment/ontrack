module Api; module V1
  class ExpensesController < BaseController
    def index
      expenses = ::Expense.all
      expenses = expenses.where('paid_at >= ?', Time.at(params[:paid_after].to_i).to_datetime) if params[:paid_after].present?
      expenses = expenses.where('paid_at <= ?', Time.at(params[:paid_before].to_i).to_datetime) if params[:paid_before].present?
      expenses = expenses.where(category_id: params[:category_id]) if params[:category_id].present?
      expenses = expenses.includes(:category) if params[:include_category] == true.to_s
      expenses = expenses.paginate(params[:page], params[:per_page]) if params[:page]
      expenses = expenses.order(normalized_sort(params[:sort], params[:sort_desc]))

      if params[:page]
        opts = {}
        opts = { include: :category } if params[:include_category] == true.to_s
        paginate(expenses, opts)
      else
        render json: expenses
      end
    end

    def create
      expense = ::Expense.new(description: params[:description], category_id: params[:category_id], amount: params[:amount], paid_at: params[:paid_at])
      successful = expense.save
      render json: expense, status: successful ? 200 : 500
    end

    def destroy
      expense = ::Expense.find(params[:id])
      successful = expense.destroy
      render json: nil, status: successful ? 200 : 500
    end

    def update
      expense = ::Expense.find(params[:id])
      successful = expense.update(category_id: params[:category_id])
      render json: nil, status: successful ? 200 : 500
    end

    private

    def normalized_sort(key, sort_desc)
      col = {
        "paid_at": "paid_at",
        "amount": "amount",
      }[key] || "paid_at"

      dir = sort_desc == "true" ? "DESC" : "ASC"

      "#{col} #{dir}"
    end
  end
end; end
