class AddTotalScoreAndExpertReviewRatingToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total_score, :string
    add_column :users, :expert_review_doc, :string
  end
end
